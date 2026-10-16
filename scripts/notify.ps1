[CmdletBinding()]
param([Parameter(Mandatory=$true)][string]$PacketPath)
$ErrorActionPreference = 'Stop'
$packet = Get-Content -LiteralPath $PacketPath -Raw -Encoding UTF8 | ConvertFrom-Json
if (-not $packet.items -or $packet.items.Count -gt 3) { throw 'Invalid notification packet' }
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType=WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType=WindowsRuntime] | Out-Null
$document = New-Object Windows.Data.Xml.Dom.XmlDocument
$description = @($packet.items | ForEach-Object { $_.name + ': ' + $_.why }) -join "`n"
$text = [Security.SecurityElement]::Escape($description)
$url = 'https://github.com/whoaha77/github-radar-reports/blob/main/reports/discoveries.md'
$document.LoadXml('<toast activationType="protocol" launch="'+$url+'"><visual><binding template="ToastGeneric"><text>GitHub Radar</text><text>'+$text+'</text></binding></visual></toast>')
$toast = [Windows.UI.Notifications.ToastNotification]::new($document)
$toast.Tag = 'github-radar'
$toast.Group = 'github-radar'
$toast.ExpirationTime = [DateTimeOffset]::Now.AddHours(2)
$notifier = $null
foreach ($appId in @('Microsoft.PowerShell_8wekyb3d8bbwe!App', 'Microsoft.Windows.PowerShell')) {
    $candidate = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId)
    if ($candidate.Setting -eq [Windows.UI.Notifications.NotificationSetting]::Enabled) {
        $notifier = $candidate
        break
    }
}
if ($null -eq $notifier) { throw 'No registered PowerShell identity with enabled Windows notifications' }
$notifier.Show($toast)
Write-Output 'submitted_to_windows'
