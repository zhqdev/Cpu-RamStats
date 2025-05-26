while ($true) {
    $cpu = Get-Counter '\Processor(_Total)\% Processor Time'
    $cpuUsage = [math]::Round($cpu.CounterSamples.CookedValue,2)
    $ram = Get-CimInstance Win32_OperatingSystem
    $totalRam = [math]::Round($ram.TotalVisibleMemorySize / 1MB, 2)
    $freeRam = [math]::Round($ram.FreePhysicalMemory / 1MB, 2)
    $usedRam = [math]::Round($totalRam - $freeRam, 2)
    Clear-Host
    Write-Host "CPU Usage: $cpuUsage %"
    Write-Host "RAM Usage: $usedRam / $totalRam GB"
    Start-Sleep -Seconds 1
}
