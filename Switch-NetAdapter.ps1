$ConfirmPreference = "none"
$wifiNet = "Wi-Fi"
$cableNet = "Ethernet"
Write-Host "Running Script to switch Net-Adapter" -ForegroundColor DarkCyan
Write-Host "Switch between $wifiNet - $cableNet "
$wifiEnabled = $false
$cableEnabled = $false

trap {
    Write-Host "Erro Found:`n$_" -ForegroundColor Red
    Read-Host "Press any key to continue"
}

foreach ($adapter in (Get-NetAdapter))
{
    if($adapter.Name -eq $wifiNet)
    {
        if($adapter.Status -ne "Disabled"){
            $wifiEnabled = $true
            continue
        }
        Write-Host "Enabling:$wifiNet " -NoNewline
        Write-Host "Disabling:$cableNet " -NoNewline
        Disable-NetAdapter -Name $cableNet
        Enable-NetAdapter -Name $wifiNet
        Write-Host "Disabling:Proxy"
        Set-Itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyEnable -value 0
        #O Windows has to open IE to update proxy settings
        $ie = new-object -ComObject internetexplorer.application
        $ie.Quit()
        Write-Host "$wifiNet Enabled and " -ForegroundColor Green -NoNewline
        Write-Host "Proxy Disabled" -ForegroundColor Red
        $wifiEnabled = $true
        $cableEnabled = $false
        break
    }
    elseif($adapter.Name -eq $cableNet)
    {

        if($adapter.Status -ne "Disabled"){
            $cableEnabled = $true
            continue
        }
        Write-Host "Enabling:$cableNet " -NoNewline
        Write-Host "Disabling:$wifiNet " -NoNewline
        Disable-NetAdapter -Name $wifiNet
        Enable-NetAdapter -Name $cableNet
        Write-Host "Enabling:Proxy"
        set-itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyEnable -value 1
        #O Windows has to open IE to update proxy settings
        $ie = new-object -ComObject internetexplorer.application
        $ie.Quit()
        Write-Host "$cableNet Enabled and " -ForegroundColor Green -NoNewline
        Write-Host "Proxy Enabled" -ForegroundColor Green
        $cableEnabled = $true
        $wifiEnabled = $false
        break
    }
}
if($wifiEnabled -and $cableEnabled){
    Write-Host "# Both are Enabled, so disable $cableNet" -ForegroundColor Yellow
    Write-Host "Enabling:$wifiNet " -ForegroundColor Green -NoNewline
    Write-Host "Disabling:$cableNet " -ForegroundColor Red -NoNewline
    Disable-NetAdapter -Name $cableNet
    Enable-NetAdapter -Name $wifiNet
    Write-Host "Disabling:Proxy" -ForegroundColor Red
    Set-Itemproperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyEnable -value 0
    #O Windows has to open IE to update proxy settings
    $ie = new-object -ComObject internetexplorer.application
    $ie.Quit()
    Write-Host "$wifiNet Enabled and " -ForegroundColor Green -NoNewline
    Write-Host "Proxy Disabled" -ForegroundColor Red
}elseif((-not $wifiEnabled) -and (-not $cableEnabled)){
    Write-Host "$wifiNet and $cableNet does not Exist. Set then properly" -ForegroundColor Red
}
Read-Host "Press any key to continue"