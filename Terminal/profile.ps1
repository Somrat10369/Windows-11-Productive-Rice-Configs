# ============================================================
#  PowerShell Profile — **your username**
#  A clean, organized, and fun PowerShell configuration
# ============================================================

# ─────────────────────────────────────────────────────────────
#  0. PROFILE LOAD TIMER
# ─────────────────────────────────────────────────────────────
$_profileTimer = [System.Diagnostics.Stopwatch]::StartNew()
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# ─────────────────────────────────────────────────────────────
#  1. ENVIRONMENT VARIABLES
# ─────────────────────────────────────────────────────────────
$env:PYTHONIOENCODING="utf-8"
$env:YAZI_FILE_ONE             = 'C:/Program Files/Git/usr/bin/file.exe'
$env:FZF_DEFAULT_COMMAND       = 'fd --type f --hidden --follow --exclude .git'
$env:FZF_CTRL_T_COMMAND        = $env:FZF_DEFAULT_COMMAND
$env:FZF_ALT_C_COMMAND         = 'fd --type d --hidden --follow --exclude .git'
$env:_ZO_FZF_OPTS              = "--preview 'eza --tree --level=2 --color=always {}' --preview-window '~3'"
$env:ANTHROPIC_BASE_URL        = 'http://localhost:8001'
$env:CLAUDE_CODE_ATTRIBUTION_HEADER = '0'
$env:CLAUDE_PLUGIN_ROOT = "C:/Users/**your username**/.claude/plugins"
iex "$(thefuck --alias)"


atuin init powershell | Out-String | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ─────────────────────────────────────────────────────────────
#  2. LISTING (EZA)
# ─────────────────────────────────────────────────────────────
foreach ($a in 'ls', 'cat') {
    if (Get-Alias $a -ErrorAction SilentlyContinue) {
        Remove-Item "Alias:$a" -Force
    }
}

function ls  { eza --icons --group-directories-first @args }
function ll  { eza -l --icons --git --group-directories-first @args }
function la  { eza -a --icons --group-directories-first @args }
function lla { eza -la --icons --git --group-directories-first @args }
function lt  { eza --tree --icons --level=2 @args }

function cat {
    if (Get-Command bat -ErrorAction SilentlyContinue) { bat @args }
    else { Get-Content @args }
}

# ─────────────────────────────────────────────────────────────
#  3. NAVIGATION
# ─────────────────────────────────────────────────────────────
if (Get-Alias cd -ErrorAction SilentlyContinue) { Remove-Item Alias:cd -Force }
function cd {
    param([string]$Path)
    if ($Path) { z $Path } else { Set-Location $HOME }
}

$global:_dirStack = [System.Collections.Generic.List[string]]::new()
$global:_lastDir  = $PWD.Path

function back {
    if ($global:_dirStack.Count -eq 0) {
        Write-Host 'Directory stack is empty.' -ForegroundColor Yellow
        return
    }
    $prev = $global:_dirStack[0]
    $global:_dirStack.RemoveAt(0)
    Set-Location $prev
}
Set-Alias - back

function dirs {
    param([int]$Index = -1)
    if ($Index -ge 0) {
        if ($Index -ge $global:_dirStack.Count) {
            Write-Host "Stack only has $($global:_dirStack.Count) entr$(if($global:_dirStack.Count -eq 1){'y'}else{'ies'})." -ForegroundColor Yellow
            return
        }
        $target = $global:_dirStack[$Index]
        $global:_dirStack.RemoveAt($Index)
        Set-Location $target
        return
    }
    if ($global:_dirStack.Count -eq 0) {
        Write-Host 'Directory stack is empty.' -ForegroundColor Yellow
        return
    }
    for ($i = 0; $i -lt $global:_dirStack.Count; $i++) {
        Write-Host ('{0,3}  {1}' -f $i, $global:_dirStack[$i]) -ForegroundColor Cyan
    }
}

function up {
    param([int]$N = 1)
    if ($N -lt 1) { $N = 1 }
    $target = $PWD.Path
    for ($i = 0; $i -lt $N; $i++) {
        $parent = Split-Path $target -Parent
        if (-not $parent) { break }
        $target = $parent
    }
    Set-Location $target
}

function fcd {
    $dir = fd --type d --hidden --follow --exclude .git |
           fzf --prompt 'Jump to > ' `
               --preview 'eza --tree --level=2 --color=always {}' `
               --preview-window '~3'
    if ($dir) { Set-Location $dir }
}

# ─────────────────────────────────────────────────────────────
#  4. FILE MANAGER (YAZI)
# ─────────────────────────────────────────────────────────────
function edit {
    param([Parameter(ValueFromRemainingArguments)]$Path)
    $editors = @('nvim', 'vim', 'nano', 'emacs', 'code', 'code-insiders')
    foreach ($editor in $editors) {
        if (Get-Command $editor -ErrorAction SilentlyContinue) {
            & $editor @Path
            return
        }
    }
    Write-Host 'No editor found. Install one first.' -ForegroundColor Red
}

function y {
    $tmpCwd  = [System.IO.Path]::GetTempFileName()
    $tmpFile = [System.IO.Path]::GetTempFileName()
    try {
        yazi @args --cwd-file="$tmpCwd" --chooser-file="$tmpFile"
        $fileSelected = $false
        if (Test-Path $tmpFile) {
            $content = Get-Content $tmpFile -Raw -ErrorAction SilentlyContinue
            if ($null -ne $content -and -not ([string]::IsNullOrWhiteSpace($content))) {
                $raw = $content.Trim()
                $fileSelected = $true
                if ($raw -match '^(edit|vscode|nvim):"?(.+?)"?$') {
                    $action = $Matches[1]
                    $file   = $Matches[2]
                    switch ($action) {
                        'edit'   { edit $file }
                        'vscode' { & "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe" $file }
                        'nvim'   { nvim $file }
                    }
                } else {
                    edit $raw
                }
            }
        }
        if (-not $fileSelected -and (Test-Path $tmpCwd)) {
            $dirContent = Get-Content $tmpCwd -ErrorAction SilentlyContinue
            if ($null -ne $dirContent) {
                $lastDir = $dirContent.Trim()
                if ($lastDir -and (Test-Path $lastDir -PathType Container) -and $lastDir -ne $PWD.Path) {
                    Set-Location $lastDir
                }
            }
        }
    }
    finally {
        Remove-Item $tmpCwd  -Force -ErrorAction SilentlyContinue
        Remove-Item $tmpFile -Force -ErrorAction SilentlyContinue
    }
}

# ─────────────────────────────────────────────────────────────
#  5. FILE OPERATIONS
# ─────────────────────────────────────────────────────────────
function touch {
    param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Paths)
    foreach ($p in $Paths) {
        if (Test-Path $p) { (Get-Item $p).LastWriteTime = Get-Date }
        else              { New-Item -ItemType File -Path $p | Out-Null }
    }
}

function mkcd {
    param([Parameter(Mandatory)][string]$Path)
    New-Item -ItemType Directory -Path $Path -Force | Out-Null
    Set-Location $Path
}

function yc {
    param([string]$Path)
    if (Test-Path $Path) {
        Get-Content $Path | Set-Clipboard
        Write-Host "Contents of $Path copied to clipboard." -ForegroundColor Cyan
    } else {
        Write-Error "File not found: $Path"
    }
}

function ac {
    param(
        [Parameter(Mandatory=$true, Position=0)][string]$filename,
        [Parameter(Position=1, ValueFromPipeline=$true)][string[]]$data
    )
    begin { $buffer = @() }
    process { if ($data) { $buffer += $data } }
    end {
        if (-not $buffer) {
            Write-Host "> " -NoNewline
            $buffer = @()
            while ($true) {
                $line = Read-Host
                if ($line -eq "") { break }
                $buffer += $line
            }
        }
        try {
            Add-Content -Path $filename -Value ($buffer -join "`n") -Encoding utf8
        }
        catch {
            Write-Error "Append failed: $($_.Exception.Message)"
        }
    }
}

function acc {
    param(
        [Parameter(Mandatory=$true, Position=0)][string]$filename,
        [Parameter(Position=1, ValueFromPipeline=$true)][string[]]$data
    )
    begin { $buffer = @() }
    process { if ($data) { $buffer += $data } }
    end {
        if (-not $buffer) {
            Write-Host "> " -NoNewline
            $buffer = @()
            while ($true) {
                $line = Read-Host
                if ($line -eq "") { break }
                $buffer += $line
            }
        }
        try {
            Set-Content -Path $filename -Value ($buffer -join "`n") -Encoding utf8
        }
        catch {
            Write-Error "Write failed: $($_.Exception.Message)"
        }
    }
}

# ─────────────────────────────────────────────────────────────
#  6. APP LAUNCHER
# ─────────────────────────────────────────────────────────────
function open {
    param([string]$AppName)
    $searchPaths = @(
        "$env:USERPROFILE\Desktop",
        "$env:APPDATA\Microsoft\Windows\Start Menu\Programs",
        "$env:ProgramData\Microsoft\Windows\Start Menu\Programs",
        "$env:LOCALAPPDATA\Programs",
        "$env:PROGRAMFILES\Programs"
    )
    $map = @{}
    $searchPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        Get-ChildItem -Path $_ -Filter '*.lnk' -Recurse -ErrorAction SilentlyContinue |
        ForEach-Object { $map[$_.BaseName] = $_.FullName }
    }
    if ($map.Count -eq 0) { Write-Host 'No shortcuts found.' -ForegroundColor Red; return }
    $selected = if ($AppName) {
        $map.Keys | fzf --query $AppName --select-1 --exit-0 --prompt 'Open App > '
    } else {
        $map.Keys | Sort-Object | fzf --prompt 'Open App > '
    }
    if (-not $selected) { Write-Host 'No app selected.' -ForegroundColor Yellow; return }
    $lnkPath = $map[$selected]
    if ($lnkPath) {
        $executable = Start-Process -FilePath $lnkPath -PassThru -ErrorAction SilentlyContinue
        if (-not $executable) { Write-Host "Could not launch: $selected" -ForegroundColor Red }
    } else {
        Write-Host "Could not resolve: $selected" -ForegroundColor Red
    }
}

# ─────────────────────────────────────────────────────────────
#  7. CLIPBOARD & UTILS
# ─────────────────────────────────────────────────────────────
function Copy-Location {
    $path = (Get-Location).Path -replace 'Md\. Nadim Mahmud', '**your username**'
    Set-Clipboard -Value $path
    Write-Host "Copied: $path" -ForegroundColor Cyan
}
Set-Alias cwd Copy-Location
Set-Alias ccd Copy-Location

function which {
    param([Parameter(Mandatory)][string]$Command)
    (Get-Command $Command -ErrorAction SilentlyContinue).Source
}

function reload {
    . "$PROFILE"\profile.ps1 ; cls ; fastfetch
    Write-Host "  Profile reloaded successfully!" -ForegroundColor Green
}

# ─────────────────────────────────────────────────────────────
#  8. GIT SHORTCUTS
# ─────────────────────────────────────────────────────────────
function gs  { git status @args }
function ga  { git add @args }
function gc  { git commit -m @args }
function gp  { git push @args }
function gl  { git log --oneline --graph --decorate --all @args }
function gco { git checkout @args }
function gd  { git diff @args }

# ─────────────────────────────────────────────────────────────
#  9. AI QUERY HELPERS
# ─────────────────────────────────────────────────────────────
function why  { ask "why $($args -join ' ')"  }
function how  { ask "how $($args -join ' ')"  }
function what { ask "what $($args -join ' ')" }
function who  { ask "who $($args -join ' ')"  }
function when { ask "when $($args -join ' ')" }
function ??   { ask @args }

# ─────────────────────────────────────────────────────────────
#  10. SYSTEM UTILITIES
# ─────────────────────────────────────────────────────────────
function sysinfo {
    $os  = Get-CimInstance Win32_OperatingSystem
    $cpu = Get-CimInstance Win32_Processor      | Select-Object -First 1
    $gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1
    $ramUsedGB  = [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / 1MB, 1)
    $ramTotalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 1)
    $disks = Get-PSDrive -PSProvider FileSystem |
        Where-Object { $_.Used -and $_.Free } |
        ForEach-Object {
            $usedGB = [math]::Round($_.Used / 1GB, 1)
            $freeGB = [math]::Round($_.Free / 1GB, 1)
            "$($_.Name): ${usedGB} GB used / ${freeGB} GB free"
        }
    $uptime    = (Get-Date) - $os.LastBootUpTime
    $uptimeStr = '{0}d {1}h {2}m' -f [int]$uptime.TotalDays, $uptime.Hours, $uptime.Minutes

    Write-Host ''
    Write-Host '    System Info' -ForegroundColor Cyan
    Write-Host '  ───────────────────────────────────────' -ForegroundColor DarkGray
    Write-Host ("  󰍛   CPU:    {0}" -f $cpu.Name)                                           -ForegroundColor White
    Write-Host ("  󰜉   GPU:    {0}" -f $gpu.Name)                                           -ForegroundColor White
    Write-Host ("  󰖩   RAM:    {0} / {1} GB" -f $ramUsedGB, $ramTotalGB)                    -ForegroundColor White
    foreach ($d in $disks) {
        Write-Host ("  󰛼   {0}" -f $d)                                              -ForegroundColor White
    }
    Write-Host ("  󰖯   Uptime: {0}" -f $uptimeStr)                                          -ForegroundColor White
    Write-Host ("     Windows Build {0} ({1})" -f $os.BuildNumber, $os.Caption)      -ForegroundColor White
    Write-Host ('  󰛶   Hostname: {0}' -f $env:COMPUTERNAME)                           -ForegroundColor White
    Write-Host ''
}

function proc {
    param([string]$Name)
    $lines = Get-Process | Sort-Object CPU -Descending |
        ForEach-Object {
            '{0,-30} CPU:{1,6}  MEM:{2,7} MB  PID:{3}' -f `
                $_.Name,
                [math]::Round($_.CPU, 1),
                [math]::Round($_.WorkingSet64 / 1MB, 1),
                $_.Id
        }
    $selected = if ($Name) {
        $lines | fzf --multi --query $Name --prompt 'Kill > ' `
                     --header 'TAB=multi-select  ENTER=kill  ESC=cancel'
    } else {
        $lines | fzf --multi --prompt 'Kill > ' `
                     --header 'TAB=multi-select  ENTER=kill  ESC=cancel'
    }
    if (-not $selected) { return }
    foreach ($line in $selected) {
        if ($line -match 'PID:(\d+)') {
            $id = [int]$Matches[1]
            try {
                Stop-Process -Id $id -Force -ErrorAction Stop
                Write-Host "  Killed PID $id" -ForegroundColor Green
            } catch {
                Write-Host "  Failed PID $id — $_" -ForegroundColor Red
            }
        }
    }
}

function port {
    param([Parameter(Mandatory)][int]$Number)
    $conns = Get-NetTCPConnection -LocalPort $Number -ErrorAction SilentlyContinue
    if (-not $conns) {
        Write-Host "  Nothing is listening on port $Number." -ForegroundColor Yellow
        return
    }
    Write-Host ''
    Write-Host "  Port $Number" -ForegroundColor Cyan
    Write-Host '  ──────────────────────────────────────────' -ForegroundColor DarkGray
    foreach ($c in $conns) {
        $proc = Get-Process -Id $c.OwningProcess -ErrorAction SilentlyContinue
        $name = if ($proc) { $proc.Name } else { '<unknown>' }
        Write-Host ("  PID {0,-6}  {1,-24}  State: {2}" -f $c.OwningProcess, $name, $c.State) -ForegroundColor White
    }
    Write-Host ''
}

function timer {
    param([Parameter(Mandatory)][int]$Seconds, [string]$Label = 'Timer')
    $total    = $Seconds
    $barWidth = 38
    Write-Host ''
    while ($Seconds -gt 0) {
        $elapsed = $total - $Seconds
        $filled  = [math]::Round(($elapsed / $total) * $barWidth)
        $empty   = $barWidth - $filled
        $bar     = ('█' * $filled) + ('░' * $empty)
        $pct     = [math]::Round(($elapsed / $total) * 100)
        $mins    = [math]::Floor($Seconds / 60)
        $secs    = $Seconds % 60
        $timeStr = '{0:D2}:{1:D2}' -f $mins, $secs
        Write-Host "`r  $Label  [$bar]  $timeStr  $pct%" -ForegroundColor Cyan -NoNewline
        Start-Sleep -Seconds 1
        $Seconds--
    }
    Write-Host "`r  $Label  [$('█' * $barWidth)]  00:00  100%" -ForegroundColor Green
    Write-Host ''
    Write-Host '  ✔ Done!' -ForegroundColor Green
    Write-Host ''
    [System.Console]::Beep(880,  300)
    Start-Sleep -Milliseconds 120
    [System.Console]::Beep(1100, 500)
}

function weather {
    param([string]$Location)
    try {
        if ($Location) {
            $response = Invoke-RestMethod -Uri "wttr.in/$Location?format=3&full" -UseBasicParsing
        } else {
            $response = Invoke-RestMethod -Uri "wttr.in/?format=3&full" -UseBasicParsing
        }
        Write-Host ''
        Write-Host "    Weather" -ForegroundColor Cyan
        Write-Host '  ───────────────────────────────────────' -ForegroundColor DarkGray
        Write-Host "  $response" -ForegroundColor White
        Write-Host ''
    } catch {
        Write-Host "  Weather unavailable: $_" -ForegroundColor Yellow
    }
}

# ─────────────────────────────────────────────────────────────
#  11. EASTER EGGS & FUN
# ─────────────────────────────────────────────────────────────
function matrix {
    $width  = $Host.UI.RawUI.WindowSize.Width
    $height = $Host.UI.RawUI.WindowSize.Height - 1
    $drops = @()
    1..$width | ForEach-Object { $drops += (Get-Random -Minimum 0 -Maximum $height) }
    Write-Host "Press Ctrl+C to exit" -ForegroundColor Green
    while ($true) {
        for ($i = 0; $i -lt $width; $i++) {
            if ($drops[$i] -lt $height) {
                Write-Host -NoNewline -ForegroundColor Green ([char](Get-Random -Minimum 33 -Maximum 126))
                Write-Host -NoNewline -ForegroundColor Black " "
            } else {
                Write-Host -NoNewline "  "
            }
            $drops[$i]++
            if ($drops[$i] -gt $height) { $drops[$i] = 0 }
        }
        Write-Host ""
        Start-Sleep -Milliseconds 50
    }
}

function ttsb {
    param($text)
    ssh somrat10369@100.97.124.116 -p 8022 "termux-tts-speak -l bn '$text'"
}

function ttse {
    param($text)
    ssh somrat10369@100.97.124.116 -p 8022 "termux-tts-speak -l en '$text'"
}

function hack {
    param([switch]$Interactive, [switch]$Silent)

    $startTime = Get-Date
    $sessionId = Get-Random -Minimum 10000 -Maximum 99999

    # Real system info for believability
    $realHostname = $env:COMPUTERNAME
    $realUsername = $env:USERNAME
    $realIP = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet","Wi-Fi" -ErrorAction SilentlyContinue | Select-Object -First 1).IPAddress
    if (-not $realIP) { $realIP = "192.168.1.$(Get-Random -Minimum 1 -Maximum 254)" }
    $realMAC = (Get-NetAdapter -ErrorAction SilentlyContinue | Select-Object -First 1).MacAddress
    if (-not $realMAC) { $realMAC = "00:1A:2B:$(Get-Random -Minimum 10 -Maximum 99):$(Get-Random -Minimum 10 -Maximum 99):$(Get-Random -Minimum 10 -Maximum 99)" }

    # Icons
    $icons = @('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '')

    # Dynamic targets based on real network
    $networkPrefix = ($realIP -split '\.')[0..2] -join '.'
    $targets = @(
        $realHostname,
        "${networkPrefix}.1",
        "${networkPrefix}.254",
        "DC01.corp.local",
        "FILESRV01",
        "EXCHANGE01",
        "SQLPROD01",
        "SHAREPOINT.corp.local",
        "192.168.1.100",
        "10.0.0.50"
    )

    # Real-looking tools (Expanded arsenal)
    $tools = @(
        "Mimikatz v2.2.0 (gentilkiwi)",
        "BloodHound v4.2.0",
        "Cobalt Strike Beacon v4.9",
        "Metasploit Framework v6.3.44",
        "Empire PS v3.8.2",
        "CrackMapExec v5.4.0",
        "Rubeus v2.1.0",
        "SharpHound v3.2.0",
        "Impacket v0.10.0",
        "Responder v3.1.4",
        "Sliver v0.8.3",
        "BruteBracer v2.0",
        "Nishang v4.0",
        "Koadic v2.7.0",
        "Covenant v2.3",
        "VenomShell v1.4",
        "Psexec v5.2",
        "Procdump64 v3.0",
        "Seatbelt v5.5",
        "PowerUp v1.0",
        "PowerSploit v1.5",
        "Hashcat v6.2.6",
        "John the Ripper v1.9.0",
        "Hydra v9.5",
        "Nmap v8.0",
        "Masscan v1.3",
        "SQLMap v1.7",
        "BeEF v0.4.0",
        "Ettercap v1.2.0",
        "Bettercap v2.3",
        "Armitage v4.0",
        "Metarpc v2.1",
        "Pthomev1.0",
        "Creddump v2.4",
        "Seatbelt v5.8",
        "SharpUp v3.0",
        "SharpADC v1.2",
        "SharpGeniX v1.8",
        "SharpDPAPI v2.0",
        "SharpWeb v1.5"
    )

    # Exploit database (Expanded with real CVEs)
    $exploits = @(
        "CVE-2024-0012 (PrintNightmare variant)",
        "CVE-2023-21768 (Windows EoP)",
        "CVE-2023-38831 (WinRAR RCE)",
        "CVE-2024-1086 (Kernel UAF)",
        "CVE-2023-29357 (NTLM Relay)",
        "Zerologon (CVE-2020-1472)",
        "PetitPotam (MS-EFSR)",
        "ProxyLogon (CVE-2021-26855)",
        "NoPAC (CVE-2021-42278)",
        "sAMAccountName Spoofing",
        "CVE-2024-21419 (Print Spooler)",
        "CVE-2023-36794 (PrintNightmare)",
        "CVE-2021-34527 (ProxyLogon)",
        "CVE-2020-0796 (Print RCE)",
        "CVE-2021-34490 (EternalBlue)",
        "CVE-2020-1350 (Log4Shell)",
        "CVE-2021-44228 (Log4Shell)",
        "CVE-2022-41040 (ProxyLogon 2.0)",
        "CVE-2023-38545 (PrintNightmare 2.0)",
        "CVE-2024-21417 (Print Spooler RCE)",
        "CVE-2022-30190 (ProxyShell)",
        "CVE-2021-26855 (PrintNightmare)",
        "CVE-2020-1472 (Zerologon)",
        "CVE-2023-21777 (Win32k EoP)",
        "CVE-2024-21408 (PrintNightmare+)",
        "CVE-2023-36770 (ProxyLogon3)",
        "CVE-2024-30853 (Rust EoP)",
        "CVE-2024-33826 (Copper EoP)",
        "CVE-2024-21404 (PrintNightmare)",
        "CVE-2021-26412 (ProxyShell RCE)"
    )

    # Process names to "inject" into
    $processes = @("lsass.exe", "svchost.exe", "explorer.exe", "winlogon.exe", "csrss.exe", "services.exe", "spoolsv.exe", "wmiprvse.exe", "taskeng.exe", "dllhost.exe")

    # Write-Host ''
    if (-not $Silent) {
        Write-Host "    INITIALIZING HACK SEQUENCE..." -ForegroundColor Red -BackgroundColor Black
        Write-Host ''
    }

    # Interactive mode
    if ($Interactive) {
        Write-Host "  [!] INTERACTIVE MODE DETECTED" -ForegroundColor Red -BackgroundColor Black
        Write-Host ''
        Write-Host "  WARNING: This executes a simulated attack simulation." -ForegroundColor Yellow
        Write-Host "  All actions are logged. Continue? (y/n): " -NoNewline -ForegroundColor White
        $confirm = Read-Host

        if ($confirm -ne 'y' -and $confirm -ne 'Y') {
            Write-Host "  Operation cancelled. Logs preserved." -ForegroundColor DarkGray
            return
        }

        Write-Host ''
        Write-Host "  Enter target hostname/IP (or press Enter for auto-scan): " -NoNewline -ForegroundColor White
        $target = Read-Host
        if (-not $target) { $target = Get-Random -InputObject $targets }

        Write-Host ''
        Write-Host "  Enter operator alias: " -NoNewline -ForegroundColor White
        $alias = Read-Host
        if (-not $alias) { $alias = "xX_Shadow_Xx" }

        Write-Host ''
        Write-Host "  Select operation type: " -NoNewline -ForegroundColor White
        Write-Host "[1] Data Exfil  [2] Ransomware  [3] APT Simulation  [4] Full Compromise" -ForegroundColor DarkGray
        $opType = Read-Host
        $operation = switch ($opType) {
            "1" { "Operation: BLACKOUT" }
            "2" { "Operation: LOCKBIT-3.0" }
            "3" { "Operation: LAZARUS" }
            _ { "Operation: PHANTOM" }
        }
    } else {
        $target = Get-Random -InputObject $targets
        $alias = "Anonymous"
        $operation = "Operation: GHOST_PROTOCOL"
    }

    # Header
    Write-Host ''
    Write-Host "  ╔══════════════════════════════════════════════════════════╗" -ForegroundColor DarkRed
    Write-Host "  ║    COVERT OPERATIONS TERMINAL                          ║" -ForegroundColor DarkRed
    Write-Host "  ║  Session: $sessionId                                       ║" -ForegroundColor DarkRed
    Write-Host "  ╚══════════════════════════════════════════════════════════╝" -ForegroundColor DarkRed
    Write-Host ''

    Start-Sleep -Milliseconds 500

    # Network scan phase
    Write-Host "  [SCAN] Enumerating network topology..." -ForegroundColor Cyan
    Start-Sleep -Milliseconds 300
    Write-Host "       Local IP:     $realIP" -ForegroundColor DarkCyan
    Write-Host "       MAC Address:  $realMAC" -ForegroundColor DarkCyan
    Write-Host "       Hostname:     $realHostname" -ForegroundColor DarkCyan
    Write-Host "       User Context: $realUsername" -ForegroundColor DarkCyan
    Write-Host ''
    Start-Sleep -Milliseconds 400

    Write-Host "  [SCAN] Discovering targets on $networkPrefix.0/24..." -ForegroundColor Cyan
    for ($i = 1; $i -le 10; $i++) {
        $scanIP = "${networkPrefix}.$i"
        $status = Get-Random -InputObject @("LIVE", "FILTERED", "OPEN")
        $port = Get-Random -InputObject @(22, 80, 443, 445, 3389, 8080, 1433, 3306)
        Write-Host "    $scanIP : $port  [$status]" -ForegroundColor $(if($status -eq "LIVE"){"Green"}else{"DarkGray"})
        Start-Sleep -Milliseconds 50
    }
    Write-Host "    Target acquired: $target" -ForegroundColor Green
    Write-Host ''
    Start-Sleep -Milliseconds 500

    # Fast matrix rain (4-8 seconds for pacing)
    Write-Host "  [PHASE 1] DEPLOYING NEURAL OVERLAY..." -ForegroundColor Green
    $matrixTime = Get-Random -Minimum 4 -Maximum 8
    $matrixEnd = (Get-Date).AddSeconds($matrixTime)

    $width  = [Math]::Min($Host.UI.RawUI.WindowSize.Width - 2, 120)
    $height = [Math]::Min($Host.UI.RawUI.WindowSize.Height - 12, 40)
    $drops = @()
    1..$width | ForEach-Object { $drops += (Get-Random -Minimum 0 -Maximum $height) }

    $matrixChars = '01ｦﾊﾐﾋｰｳｼﾅﾓﾆｻﾜﾂｵﾘｱﾎﾃﾏｹﾒｴｶﾑﾕﾗｾﾈｽﾀﾇﾍ' + ''

    while ((Get-Date) -lt $matrixEnd) {
        for ($i = 0; $i -lt $width; $i++) {
            if ($drops[$i] -lt $height) {
                $char = $matrixChars[(Get-Random -Minimum 0 -Maximum $matrixChars.Length)]
                $color = Get-Random -InputObject @([ConsoleColor]::Green, [ConsoleColor]::DarkGreen, [ConsoleColor]::Black)
                Write-Host -NoNewline -ForegroundColor $color $char
                Write-Host -NoNewline -BackgroundColor Black " "
            } else {
                Write-Host -NoNewline "  "
            }
            $drops[$i]++
            if ($drops[$i] -gt $height) { $drops[$i] = 0 }
        }
        Write-Host ""
    }

    Write-Host ''

    # Tool deployment
    Write-Host "  [PHASE 2] DEPLOYING TOOLKIT..." -ForegroundColor Green
    $selectedTools = Get-Random -InputObject $tools -Count 4
    foreach ($tool in $selectedTools) {
        $hash = -join ((Get-Random -Count 64 -InputObject '0123456789abcdef'.ToCharArray()))
        $randTime = Get-Random -Minimum 80 -Maximum 250
        Start-Sleep -Milliseconds $randTime
        Write-Host "       $tool" -ForegroundColor DarkGreen -NoNewline
        Write-Host " [SHA256: ${hash}...]" -ForegroundColor DarkGray
    }
    Write-Host ''

    # Exploit selection
    $selectedExploit = Get-Random -InputObject $exploits
    $targetProcess = Get-Random -InputObject $processes
    $shellPort = Get-Random -InputObject @(4444, 5555, 8888, 9999, 31337)

    Write-Host "  [PHASE 3] EXPLOIT EXECUTION..." -ForegroundColor Green
    Write-Host "    Exploit:  $selectedExploit" -ForegroundColor DarkGreen
    Write-Host "    Target:   $targetProcess (PID: $(Get-Random -Minimum 1000 -Maximum 9999))" -ForegroundColor DarkGreen
    Write-Host "    Shell:    reverse_tcp on port $shellPort" -ForegroundColor DarkGreen
    Write-Host ''
    Start-Sleep -Milliseconds 600

    # Attack phases with dynamic status (Expanded attack chain)
    $attackPhases = @(
        @{Name="Network Recon"; Icon="󰖯"; Status=@("SCANNING","NMAP","MASSTCAN","ENUMERATING","MAPPING","WHOIS")},
        @{Name="Vuln Scan"; Icon="󰳄"; Status=@("SCANNING","VULNDB","CVE_CHECK","EXPLOITABLE","METASPLOIT")},
        @{Name="Initial Access"; Icon=""; Status=@("EXPLOITING","SHELLCODE","PAYLOAD","INJECTING","RCE","LPE")},
        @{Name="Credential Dump"; Icon=""; Status=@("DUMPING","MIMIKATZ","SEATBELT","LSASS","CRACKING","DECRYPTING")},
        @{Name="Privilege Escalation"; Icon=""; Status=@("ESCALATING","TOKENS","UNICODE","BYPASSING","ADMIN","SYSTEM")},
        @{Name="Lateral Movement"; Icon=""; Status=@("MOVING","PSEXEC","WINRM","WMI","SPRING","INFECTING")},
        @{Name="Data Collection"; Icon=""; Status=@("COLLECTING","HARVEST","SHADOW","COMPRESSING","UPLOADING","EXFIL")},
        @{Name="Persistence"; Icon=""; Status=@("INSTALLING","REGSVR","HKCU","SERVICE","FINALIZING","ROOTKIT")},
        @{Name="C2 Establish"; Icon=""; Status=@("CONNECTING","BEACON","HANDSHAKE","ENCRYPTED","TUNNEL")},
        @{Name="Post-Exploit"; Icon=""; Status=@("ENUMERATING","MAPPING","PRIVILEGE","OWNERSHIP","CONTROL")}
    )

    $sw = [System.Diagnostics.Stopwatch]::StartNew()

    foreach ($phase in $attackPhases) {
        $randTime = Get-Random -Minimum 150 -Maximum 400
        Start-Sleep -Milliseconds $randTime
        $status = Get-Random -InputObject $phase.Status
        $progress = Get-Random -Minimum 0 -Maximum 100
        $bar = ('█' * ([int]($progress/10))) + ('░' * (10 - [int]($progress/10)))
        Write-Host "    $($phase.Icon)  $($phase.Name.PadRight(20)) [$bar] $status" -ForegroundColor Green
    }

    $sw.Stop()
    $actualTime = [math]::Round($sw.ElapsedMilliseconds / 1000, 3)

    # Generate realistic-looking tokens
    $accessToken = -join ((Get-Random -Count 128 -InputObject 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_'.ToCharArray()))
    $refreshToken = -join ((Get-Random -Count 256 -InputObject '0123456789abcdef'.ToCharArray()))
    $aesKey = -join ((Get-Random -Count 64 -InputObject '0123456789ABCDEF'.ToCharArray()))

    # Credentials "dumped"
    $dumpedCreds = @(
        "Administrator : NTLM:aad3b435b51404eeaad3b435b51404ee:$(Get-Random -Minimum 1000000000000000 -Maximum 9999999999999999):::",
        "DefaultAccount : NTLM:aad3b435b51404eeaad3b435b51404ee:0000000000000000:::",
        "$realUsername : NTLM:aad3b435b51404ee:$(Get-Random -Minimum 1000000000000000 -Maximum 9999999999999999):::",
        "WDAGUtilityAccount : NTLM:aad3b435b51404ee:LOCKED:::"
    )

    # Final access banner
    Write-Host ''
    Write-Host "  ╔══════════════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "  ║                                                          ║" -ForegroundColor Red
    Write-Host "  ║             ACCESS GRANTED                            ║" -ForegroundColor Red -BackgroundColor Black
    Write-Host "  ║                                                          ║" -ForegroundColor Red
    Write-Host "  ╚══════════════════════════════════════════════════════════╝" -ForegroundColor Red
    Write-Host ''

    # Operation summary (Enhanced with more details)
    Write-Host ''
    Write-Host "  ┌─ $operation ────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ╭─ Target:         $target" -ForegroundColor White -NoNewline; Write-Host "              │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Hostname:       $realHostname" -ForegroundColor White -NoNewline; Write-Host "              │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Admin Status:   YES" -ForegroundColor DarkGreen -NoNewline; Write-Host "   │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Session ID:     $sessionId" -ForegroundColor Cyan -NoNewline; Write-Host "                    │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Time Elapsed:   ${actualTime}s" -ForegroundColor Yellow -NoNewline; Write-Host "                    │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Exploit Used:   $selectedExploit" -ForegroundColor DarkRed -NoNewline; Write-Host "                │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ C2 Callback:    http://localhost:8001/v1/chat" -ForegroundColor DarkGreen -NoNewline; Write-Host "         │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ AI Backend:     Claude Mythos-Uncensored" -ForegroundColor Red -NoNewline; Write-Host "          │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Encryption:     AES-256-GCM ($aesKey)" -ForegroundColor DarkCyan -NoNewline; Write-Host " │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Shell Port:     $shellPort" -ForegroundColor DarkYellow -NoNewline; Write-Host "                │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Payload:        Java/Meterpreter/Shell" -ForegroundColor Blue -NoNewline; Write-Host "          │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Architecture:   x64/x86" -ForegroundColor DarkBlue -NoNewline; Write-Host "              │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  ├─ Host OS:        Windows 10/11/11 Pro" -ForegroundColor Green -NoNewline; Write-Host "     │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  └──────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ''

    # Dumped credentials
    Write-Host "    CREDENTIALS DUMPED:" -ForegroundColor Red
    foreach ($cred in $dumpedCreds) {
        Write-Host "    $cred" -ForegroundColor DarkGray
    }
    Write-Host ''

    # Tokens
    Write-Host "    ACCESS TOKEN:" -ForegroundColor Cyan
    Write-Host "    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.$accessToken" -ForegroundColor DarkGray
    Write-Host ''
    Write-Host "    REFRESH TOKEN:" -ForegroundColor Cyan
    Write-Host "    $refreshToken" -ForegroundColor DarkGray
    Write-Host ''

    # Scary audio sequence (Enhanced)
    if (-not $Silent) {
        [System.Console]::Beep(150, 100)   # Low bass
        Start-Sleep -Milliseconds 150
        [System.Console]::Beep(200, 100)   # Rising pitch
        Start-Sleep -Milliseconds 150
        [System.Console]::Beep(250, 100)
        Start-Sleep -Milliseconds 150
        [System.Console]::Beep(300, 100)
        Start-Sleep -Milliseconds 150
        [System.Console]::Beep(400, 150)   # High note
        Start-Sleep -Milliseconds 150
        [System.Console]::Beep(500, 200)   # Alarm
        Start-Sleep -Milliseconds 200
        [System.Console]::Beep(880, 300)   # Victory sound
        Start-Sleep -Milliseconds 200
        [System.Console]::Beep(1100, 500)  # Final note
    }

    # Final message (Enhanced)
    Write-Host ''
    Write-Host "  ╔══════════════════════════════════════════════════════════╗" -ForegroundColor DarkRed
    Write-Host "  ║    System fully compromised. All your bases are ours.   ║" -ForegroundColor DarkRed
    Write-Host "  ║    Persistence established. Awaiting further commands.  ║" -ForegroundColor DarkRed
    Write-Host "  ╚══════════════════════════════════════════════════════════╝" -ForegroundColor DarkRed
    Write-Host ''
    Write-Host "  ┌─ AVAILABLE COMMANDS ─────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  help     " -NoNewline -ForegroundColor White; Write-Host '→ Show all commands' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  shells   " -NoNewline -ForegroundColor White; Write-Host '→ Open interactive shells' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  logs     " -NoNewline -ForegroundColor White; Write-Host '→ View operation logs' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  report   " -NoNewline -ForegroundColor White; Write-Host '→ Generate threat report' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  artifacts" -NoNewline -ForegroundColor White; Write-Host '→ Export collected artifacts' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  escalate " -NoNewline -ForegroundColor White; Write-Host '→ Attempt privilege escalation' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  lateral  " -NoNewline -ForegroundColor White; Write-Host '→ Attempt lateral movement' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  exfil    " -NoNewline -ForegroundColor White; Write-Host '→ Exfiltrate data' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  │" -NoNewline; Write-Host "  cleanup  " -NoNewline -ForegroundColor White; Write-Host '→ Cleanup tracks (optional)' -ForegroundColor Gray -NoNewline; Write-Host "" -NoNewline -ForegroundColor DarkGray; Write-Host "  │" -ForegroundColor DarkGray
    Write-Host "  └──────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ''
    Write-Host "  > [C2] Awaiting commands from operator... Type 'help' for options." -ForegroundColor DarkGray
    Write-Host ''
}

function MrBeast {
    Start-Process "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    Write-Host "    Never gonna give you up..." -ForegroundColor Magenta
}

# ─────────────────────────────────────────────────────────────
#  12. HELP FUNCTION
# ─────────────────────────────────────────────────────────────
function inh {
    Write-Host ''
    Write-Host '  ╔══════════════════════════════════════════════════════════╗' -ForegroundColor Cyan
    Write-Host '  ║           POWERSHELL PROFILE — COMMAND CHEATSHEET        ║' -ForegroundColor Cyan
    Write-Host '  ╚══════════════════════════════════════════════════════════╝' -ForegroundColor Cyan
    Write-Host ''

    Write-Host '  ┌─ NAVIGATION ─────────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' cd      ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Fuzzy cd (zoxide) to any directory' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' up [n]  ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Go up N directories' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' fcd     ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Fuzzy select subdirectory' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' back    ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Return to previous directory' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' -       ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Alias for back (cd -)' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' dirs    ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Show directory stack' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ FILE MANAGER ───────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' y       ' -NoNewline -ForegroundColor Magenta; Write-Host '→ Open Yazi file manager' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' edit    ' -NoNewline -ForegroundColor Magenta; Write-Host '→ Edit files (Microsoft Edit)' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ FILE OPERATIONS ────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' touch   ' -NoNewline -ForegroundColor Green; Write-Host '→ Create file / update timestamp' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' mkcd    ' -NoNewline -ForegroundColor Green; Write-Host '→ Create dir and cd into it' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' yc      ' -NoNewline -ForegroundColor Green; Write-Host '→ Copy file contents to clipboard' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' ac      ' -NoNewline -ForegroundColor Green; Write-Host '→ Append to file (interactive)' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' acc     ' -NoNewline -ForegroundColor Green; Write-Host '→ Write to file (overwrite)' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ LISTING (EZA) ──────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' ls      ' -NoNewline -ForegroundColor Blue; Write-Host '→ List with icons' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' ll      ' -NoNewline -ForegroundColor Blue; Write-Host '→ Long list with git' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' la      ' -NoNewline -ForegroundColor Blue; Write-Host '→ List all (including hidden)' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' lla     ' -NoNewline -ForegroundColor Blue; Write-Host '→ Long list all with git' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' lt      ' -NoNewline -ForegroundColor Blue; Write-Host '→ Tree view (level 2)' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' cat     ' -NoNewline -ForegroundColor Blue; Write-Host '→ Cat with bat (syntax highlight)' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ AI QUERY HELPERS ───────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' why     ' -NoNewline -ForegroundColor DarkMagenta; Write-Host '→ Ask "why ..." questions' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' how     ' -NoNewline -ForegroundColor DarkMagenta; Write-Host '→ Ask "how ..." questions' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' what    ' -NoNewline -ForegroundColor DarkMagenta; Write-Host '→ Ask "what ..." questions' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' who     ' -NoNewline -ForegroundColor DarkMagenta; Write-Host '→ Ask "who ..." questions' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' when    ' -NoNewline -ForegroundColor DarkMagenta; Write-Host '→ Ask "when ..." questions' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' ??      ' -NoNewline -ForegroundColor DarkMagenta; Write-Host '→ Generic ask command' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ GIT SHORTCUTS ──────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' gs      ' -NoNewline -ForegroundColor Red; Write-Host '→ git status' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' ga      ' -NoNewline -ForegroundColor Red; Write-Host '→ git add' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' gc      ' -NoNewline -ForegroundColor Red; Write-Host '→ git commit -m' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' gp      ' -NoNewline -ForegroundColor Red; Write-Host '→ git push' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' gl      ' -NoNewline -ForegroundColor Red; Write-Host '→ git log --oneline --graph' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' gco     ' -NoNewline -ForegroundColor Red; Write-Host '→ git checkout' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' gd      ' -NoNewline -ForegroundColor Red; Write-Host '→ git diff' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ SYSTEM UTILITIES ───────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' sysinfo ' -NoNewline -ForegroundColor DarkCyan; Write-Host '→ System snapshot with icons' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' proc    ' -NoNewline -ForegroundColor DarkCyan; Write-Host '→ Fuzzy process viewer / killer' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' port    ' -NoNewline -ForegroundColor DarkCyan; Write-Host '→ Find process by port' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' timer   ' -NoNewline -ForegroundColor DarkCyan; Write-Host '→ Countdown with progress bar' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' weather ' -NoNewline -ForegroundColor DarkCyan; Write-Host '→ Weather from wttr.in' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' reload  ' -NoNewline -ForegroundColor DarkCyan; Write-Host '→ Reload profile' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ EASTER EGGS ────────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' matrix  ' -NoNewline -ForegroundColor Green; Write-Host '→ Matrix rain effect' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' hack    ' -NoNewline -ForegroundColor Green; Write-Host '→ Fake hacker screen (scary!)' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' hack -i ' -NoNewline -ForegroundColor Green; Write-Host '→ Interactive hack mode' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' MrBeast ' -NoNewline -ForegroundColor Green; Write-Host '→ ...never gonna let you down' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ DEV TOOLS ──────────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' btop    ' -NoNewline -ForegroundColor Cyan; Write-Host '→ Real-time system monitor' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' chess   ' -NoNewline -ForegroundColor Cyan; Write-Host '→ TUI chess player' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' console ' -NoNewline -ForegroundColor Cyan; Write-Host '→ Fun ASCII animations' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host '         ' -NoNewline -ForegroundColor Cyan; Write-Host '→ topic: game' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host '         ' -NoNewline -ForegroundColor Cyan; Write-Host '→ stars-watcher, traction' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host '         ' -NoNewline -ForegroundColor Cyan; Write-Host '→ topic: print' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host '         ' -NoNewline -ForegroundColor Cyan; Write-Host '→ hacker-types, draw-x/triangles' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' roza    ' -NoNewline -ForegroundColor Cyan; Write-Host '→ Ramadan CLI' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' rust    ' -NoNewline -ForegroundColor Cyan; Write-Host '→ Rusty rain animation' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' surge   ' -NoNewline -ForegroundColor Cyan; Write-Host '→ Surge CLI downloader' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ EDITORS & SEARCH ───────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' nvim    ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Neovim' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' typing  ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Typing game CLI' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' es      ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Everything search' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' rg      ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Ripgrep' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' lg      ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Lazygit' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' fzf     ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Fuzzy finder' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' edit    ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Edit with preferred editor' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' fd      ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Find files' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' tldr    ' -NoNewline -ForegroundColor Yellow; Write-Host '→ TLDR' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' man     ' -NoNewline -ForegroundColor Yellow; Write-Host '→ Man pages' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ AI & CLOUD ─────────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' ollama  ' -NoNewline -ForegroundColor Magenta; Write-Host '→ Ollama' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' gemini  ' -NoNewline -ForegroundColor Magenta; Write-Host '→ Gemini CLI' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' claude  ' -NoNewline -ForegroundColor Magenta; Write-Host '→ Claude API' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' ytdlp   ' -NoNewline -ForegroundColor Magenta; Write-Host '→ YouTube-DL-Plus' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' ngrok   ' -NoNewline -ForegroundColor Magenta; Write-Host '→ ngrok' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' docker  ' -NoNewline -ForegroundColor Magenta; Write-Host '→ LazyDocker' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' ssh     ' -NoNewline -ForegroundColor Magenta; Write-Host '→ SSH' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' open    ' -NoNewline -ForegroundColor Magenta; Write-Host '→ Open WebUI' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host '         ' -NoNewline -ForegroundColor Cyan; Write-Host '→ docker run -d -p 3000:8080 open-webui' -ForegroundColor DarkGray
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ MEDIA & INFRA ──────────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' voice   ' -NoNewline -ForegroundColor Magenta; Write-Host '→ OmniVoice Demo' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host '         ' -NoNewline -ForegroundColor Cyan; Write-Host '→ --ip 0.0.0.0 --port 8001 --device cuda:0' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' nextdns ' -NoNewline -ForegroundColor Magenta; Write-Host '→ NextDNS' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' comfyui ' -NoNewline -ForegroundColor Magenta; Write-Host '→ ComfyUI' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host '         ' -NoNewline -ForegroundColor Cyan; Write-Host '→ comfy launch --cuda-device 0' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' curl wttr.in    ' -NoNewline -ForegroundColor Magenta; Write-Host '→ Weather ' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''

    Write-Host '  ┌─ CLIPBOARD & UTILS ──────────────────────────────────┐' -ForegroundColor DarkGray
    Write-Host '  │' -NoNewline; Write-Host ' cwd/ccd ' -NoNewline -ForegroundColor Gray; Write-Host '→ Copy current path to clipboard' -ForegroundColor White
    Write-Host '  │' -NoNewline; Write-Host ' which   ' -NoNewline -ForegroundColor Gray; Write-Host '→ Show command source path' -ForegroundColor White
    Write-Host '  └──────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
    Write-Host ''
}


# ─────────────────────────────────────────────────────────────
#  END OF PROFILE
# ─────────────────────────────────────────────────────────────
$_profileTimer.Stop()
$_ms    = $_profileTimer.ElapsedMilliseconds
$_color = if ($_ms -lt 500) { 'Green' } elseif ($_ms -lt 1500) { 'Yellow' } else { 'Red' }
Write-Host "  Profile loaded in ${_ms}ms" -ForegroundColor $_color
Remove-Variable _profileTimer, _ms, _color

oh-my-posh init pwsh --config "C:/Users/**your username**/.config/oh-my-posh/atomic.omp.json" | Invoke-Expression
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    $Env:_COMFY_COMPLETE = "complete_powershell"
    $Env:_TYPER_COMPLETE_ARGS = $commandAst.ToString()
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = $wordToComplete
    comfy | ForEach-Object {
        $commandArray = $_ -Split ":::"
        $command = $commandArray[0]
        $helpString = $commandArray[1]
        [System.Management.Automation.CompletionResult]::new(
            $command, $command, 'ParameterValue', $helpString)
    }
    $Env:_COMFY_COMPLETE = ""
    $Env:_TYPER_COMPLETE_ARGS = ""
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = ""
}
Register-ArgumentCompleter -Native -CommandName comfy -ScriptBlock $scriptblock
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    $Env:_COMFY_COMPLETE = "complete_powershell"
    $Env:_TYPER_COMPLETE_ARGS = $commandAst.ToString()
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = $wordToComplete
    comfy | ForEach-Object {
        $commandArray = $_ -Split ":::"
        $command = $commandArray[0]
        $helpString = $commandArray[1]
        [System.Management.Automation.CompletionResult]::new(
            $command, $command, 'ParameterValue', $helpString)
    }
    $Env:_COMFY_COMPLETE = ""
    $Env:_TYPER_COMPLETE_ARGS = ""
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = ""
}
Register-ArgumentCompleter -Native -CommandName comfy -ScriptBlock $scriptblock
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    $Env:_COMFY_COMPLETE = "complete_powershell"
    $Env:_TYPER_COMPLETE_ARGS = $commandAst.ToString()
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = $wordToComplete
    comfy | ForEach-Object {
        $commandArray = $_ -Split ":::"
        $command = $commandArray[0]
        $helpString = $commandArray[1]
        [System.Management.Automation.CompletionResult]::new(
            $command, $command, 'ParameterValue', $helpString)
    }
    $Env:_COMFY_COMPLETE = ""
    $Env:_TYPER_COMPLETE_ARGS = ""
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = ""
}
Register-ArgumentCompleter -Native -CommandName comfy -ScriptBlock $scriptblock

atuin init powershell | Out-String | Invoke-Expression