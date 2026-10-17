[CmdletBinding()]
param([switch]$Install, [switch]$Tick, [switch]$DryRun)
$ErrorActionPreference = 'Stop'
$env:PYTHONUTF8 = '1'
$utf8Console = New-Object System.Text.UTF8Encoding($false)
[Console]::OutputEncoding = $utf8Console
$OutputEncoding = $utf8Console
$taskName = 'GitHubRadar-whoaha77'
$markerV1 = 'GitHubRadar managed task v1; boot+30m then every 2h; user session'
$marker = 'GitHubRadar managed task v2; daily scan gated by 6h check; user session'
$checkInterval = 'PT6H'
$python = (Get-Command python -ErrorAction Stop).Source
$main = Join-Path $PSScriptRoot 'scripts\radar.py'
if ($Tick) {
    $boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime.ToUniversalTime().ToString('o')
    $logDir = Join-Path $PSScriptRoot 'logs'
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    $stamp = Get-Date -Format 'yyyyMMdd'
    & $python -I $main scan --scheduled --boot-time $boot 2>&1 |
        Out-File -LiteralPath (Join-Path $logDir "schedule-$stamp-utf8.log") -Encoding utf8 -Append
    exit $LASTEXITCODE
}
if (-not $Install) { throw 'Use -Install [-DryRun], or -Tick for a scheduled check.' }
$taskAction = '-NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File "' + (Join-Path $PSScriptRoot 'schedule.ps1') + '" -Tick'
if ($DryRun) {
    [pscustomobject]@{ TaskName=$taskName; Executable='powershell.exe'; Arguments=$taskAction;
      ScanSchedule='Boot+30 minutes, then every 24h (scan_interval_minutes=1440)';
      CheckInterval='every 6 hours; no duplicate scans';
      UserSessionRequired=$true } | ConvertTo-Json
    exit 0
}
$service = New-Object -ComObject 'Schedule.Service'
$service.Connect()
$folder = $service.GetFolder('\')
try { $existing = $folder.GetTask($taskName) } catch { $existing = $null }
if ($existing -and $existing.Definition.RegistrationInfo.Description -notin @($marker, $markerV1)) {
    throw 'Existing task has a different owner/description; not overwriting.'
}
if ($existing) {
    $backupDir = Join-Path $PSScriptRoot 'backups'
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    $existing.Xml | Set-Content -LiteralPath (Join-Path $backupDir ('schedule-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.xml')) -Encoding utf8
}
$task = $service.NewTask(0)
$task.RegistrationInfo.Description = $marker
$task.Principal.UserId = [Security.Principal.WindowsIdentity]::GetCurrent().User.Value
$task.Principal.LogonType = 3 # InteractiveToken: no password stored.
$task.Principal.RunLevel = 0
$task.Settings.Enabled = $true
$task.Settings.StartWhenAvailable = $true
$task.Settings.DisallowStartIfOnBatteries = $false
$task.Settings.StopIfGoingOnBatteries = $false
$task.Settings.MultipleInstances = 2 # IgnoreNew
$task.Settings.ExecutionTimeLimit = 'PT15M'
$task.Settings.Hidden = $true
$action = $task.Actions.Create(0)
$action.Path = (Get-Command powershell.exe -ErrorAction Stop).Source
$action.Arguments = $taskAction
$action.WorkingDirectory = $PSScriptRoot
# A lightweight check tolerates sleep/resume and delayed logon. Python gates scans
# against the actual boot timestamp, not against logon or missed timer events.
$timer = $task.Triggers.Create(1)
$timer.StartBoundary = (Get-Date).AddMinutes(1).ToString('s')
$timer.Repetition.Interval = $checkInterval
$timer.Enabled = $true
$logon = $task.Triggers.Create(9)
$logon.UserId = $task.Principal.UserId
$logon.Delay = 'PT1M'
$logon.Enabled = $true
$registered = $folder.RegisterTaskDefinition($taskName, $task, 6, $task.Principal.UserId, $null, 3)
[pscustomobject]@{ TaskName=$registered.Name; Registered=$true; UserSessionRequired=$true;
    ScanSchedule='Boot+30m then every 24h; checks every 6h; missed slots coalesce';
    State=$registered.State } | ConvertTo-Json
