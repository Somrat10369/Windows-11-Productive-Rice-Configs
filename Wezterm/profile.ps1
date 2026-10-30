$_profileTimer = [System.Diagnostics.Stopwatch]::StartNew()
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      CACHED TOOL INITIALIZATIONS & MODULES               ║
# ╚══════════════════════════════════════════════════════════════════════════╝
$cacheDir = "$HOME/.cache/powershell"
if (-not (Test-Path $cacheDir)) {
    New-Item -ItemType Directory -Path $cacheDir -Force | Out-Null
}

# --- Oh My Posh Cache ---
$ompCache = "$cacheDir/oh-my-posh.ps1"
$ompConfig = "$HOME\.config\oh-my-posh\pywal.omp.json"

if (-not (Test-Path $ompCache) -or ((Get-Item $ompConfig).LastWriteTime -gt (Get-Item $ompCache).LastWriteTime)) {
    oh-my-posh init pwsh --config $ompConfig | Set-Content -Path $ompCache -Encoding utf8
}
. $ompCache

# --- 2. Zoxide Cache ---
$zoxideCache = "$cacheDir/zoxide.ps1"
if (-not (Test-Path $zoxideCache)) {
    zoxide init powershell | Set-Content -Path $zoxideCache -Encoding utf8
}
. $zoxideCache

# --- 3. PSReadLine (Must load BEFORE Atuin so history hooks aren't overwritten) ---
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete

# --- 4. Atuin Cache ---
$atuinCache = "$cacheDir/atuin.ps1"
if (-not (Test-Path $atuinCache)) {
    atuin init powershell | Set-Content -Path $atuinCache -Encoding utf8
}
. $atuinCache

function Reload-Omp {
    $ompConfig = "$HOME\.config\oh-my-posh\pywal.omp.json"
    $ompCache = "$HOME/.cache/powershell/oh-my-posh.ps1"

    oh-my-posh init pwsh --config $ompConfig | Set-Content -Path $ompCache -Encoding utf8
    . $ompCache
}
# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      1. ENVIRONMENT VARIABLES                            ║
# ╚══════════════════════════════════════════════════════════════════════════╝
$env:PYTHONIOENCODING = "utf-8"
$env:YAZI_FILE_ONE = 'C:/Program Files/Git/usr/bin/file.exe'
$env:FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
$env:FZF_CTRL_T_COMMAND = $env:FZF_DEFAULT_COMMAND
$env:FZF_ALT_C_COMMAND = 'fd --type d --hidden --follow --exclude .git'
$env:_ZO_FZF_OPTS = "--preview 'eza --tree --level=2 --color=always {}' --preview-window '~3'"
$env:ANTHROPIC_BASE_URL = 'http://localhost:8001'
$env:CLAUDE_CODE_ATTRIBUTION_HEADER = '0'
$env:CLAUDE_PLUGIN_ROOT = "C:/Users/{usrname}/.claude/plugins"

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      2. CORE UTILS & ALIAS OVERRIDES                     ║
# ╚══════════════════════════════════════════════════════════════════════════╝
foreach ($a in 'ls', 'cat', 'cd', 'la', 'll', 'gc', 'gp', 'gl') {
  if (Get-Alias $a -ErrorAction SilentlyContinue) {
    Remove-Item "Alias:$a" -Force -ErrorAction SilentlyContinue
  }
}

function global:ls  { eza --icons --group-directories-first @args }
function global:ll  { eza -l --icons --git --group-directories-first @args }
function global:la  { eza -a --icons --group-directories-first @args }
function global:lla { eza -la --icons --git --group-directories-first @args }
function global:lt  { eza --tree --icons --level=2 @args }

function cat {
  if (Get-Command bat -ErrorAction SilentlyContinue) { bat @args }
  else { Get-Content @args }
}

function cd {
  param([string]$Path)
  if ($Path) { z $Path } else { Set-Location $HOME }
}

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      3. NAVIGATION & WORKFLOW                            ║
# ╚══════════════════════════════════════════════════════════════════════════╝
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

function edit {
    param([Parameter(ValueFromRemainingArguments)][string[]]$Path)

    $resolvedPath = @()
    foreach ($item in $Path) {
        if (Test-Path -LiteralPath $item) {
            $resolvedPath += (Resolve-Path -LiteralPath $item).Path
        } else {
            $resolvedPath += $item
        }
    }

    $choices = @(
        [pscustomobject]@{ Label = 'Microsoft Edit (terminal)'; Command = 'edit.exe' },
        [pscustomobject]@{ Label = 'Visual Studio Code'; Command = 'code' },
        [pscustomobject]@{ Label = 'Neovim'; Command = 'nvim' }
    )
    $available = @($choices | Where-Object { Get-Command $_.Command -ErrorAction SilentlyContinue })
    if (-not $available) {
        Write-Host 'No supported editor found. Install Edit, VS Code, or Neovim.' -ForegroundColor Red
        return
    }
    if (-not $Path) { $resolvedPath = @() }

    Write-Host 'Choose editor:' -ForegroundColor Cyan
    for ($i = 0; $i -lt $available.Count; $i++) {
        Write-Host ("  [{0}] {1}" -f ($i + 1), $available[$i].Label)
    }
    $choice = Read-Host "Select 1-$($available.Count)"
    $index = 0
    if (-not [int]::TryParse($choice, [ref]$index) -or $index -lt 1 -or $index -gt $available.Count) {
        Write-Host 'Invalid selection; cancelled.' -ForegroundColor Yellow
        return
    }
    $command = $available[$index - 1].Command
    & $command @resolvedPath
}

function y {
  $tmpCwd = [System.IO.Path]::GetTempFileName()
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
          $file = $Matches[2]
          switch ($action) {
            'edit' { edit $file }
            'vscode' { & "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe" $file }
            'nvim' { nvim $file }
          }
        }
        else {
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

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      4. FILE OPERATIONS                                  ║
# ╚══════════════════════════════════════════════════════════════════════════╝
function touch {
  param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Paths)
  foreach ($p in $Paths) {
    if (Test-Path $p) { (Get-Item $p).LastWriteTime = Get-Date }
    else { New-Item -ItemType File -Path $p | Out-Null }
  }
}

function yc {
  param([string]$Path)
  if (Test-Path $Path) {
    Get-Content $Path | Set-Clipboard
    Write-Host "Contents of $Path copied to clipboard." -ForegroundColor Cyan
  }
  else {
    Write-Error "File not found: $Path"
  }
}

function ac {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0)][string]$filename,
        [Parameter(Position = 1, ValueFromPipeline = $true)][AllowEmptyString()][string[]]$data
    )
    begin { $buffer = [System.Collections.Generic.List[string]]::new() }
    process {
        if ($null -ne $data) {
            foreach ($line in $data) { $buffer.Add($line) }
        }
    }
    end {
        if ($buffer.Count -eq 0) {
            Write-Host 'Enter text to append. Submit an empty line to finish.' -ForegroundColor Cyan
            while ($true) {
                $line = Read-Host
                if ($line -eq '') { break }
                $buffer.Add($line)
            }
        }
        if ($buffer.Count -eq 0) { Write-Host 'Nothing to append.' -ForegroundColor Yellow; return }
        try {
            Add-Content -LiteralPath $filename -Value ($buffer -join [Environment]::NewLine) -Encoding utf8
        } catch {
            Write-Error "Append failed: $($_.Exception.Message)"
        }
    }
}

function Copy-Location {
  $path = (Get-Location).Path
  Set-Clipboard -Value $path
  Write-Host "Copied: $path" -ForegroundColor Cyan
}
Set-Alias ccd Copy-Location

function which {
  param([Parameter(Mandatory)][string]$Command)
  (Get-Command $Command -ErrorAction SilentlyContinue).Source
}

function reload {
  . $PROFILE; Clear-Host; fastfetch
  Write-Host "  Profile reloaded successfully!" -ForegroundColor Green
}

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      5. GIT SHORTCUTS                                    ║
# ╚══════════════════════════════════════════════════════════════════════════╝
function gs { git status @args }
function ga { git add @args }
function gc { git commit -m ($args -join ' ') }
function gp { git push @args }
function gl { git log --oneline --graph --decorate --all @args }
function gco { git checkout @args }
function gd { git diff @args }

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      6. AI QUERY HELPERS                                 ║
# ╚══════════════════════════════════════════════════════════════════════════╝
function why { ask "why $($args -join ' ')" }
function how { ask "how $($args -join ' ')" }
function what { ask "what $($args -join ' ')" }
function who { ask "who $($args -join ' ')" }
function when { ask "when $($args -join ' ')" }
function ?? { ask @args }

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      7. SYSTEM UTILITIES                                 ║
# ╚══════════════════════════════════════════════════════════════════════════╝
function sysinfo {
  $os = Get-CimInstance Win32_OperatingSystem
  $cpu = Get-CimInstance Win32_Processor     | Select-Object -First 1
  $gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1
  $ramUsedGB = [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / 1MB, 1)
  $ramTotalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 1)
  $disks = Get-PSDrive -PSProvider FileSystem |
  Where-Object { $_.Used -and $_.Free } |
  ForEach-Object {
    $usedGB = [math]::Round($_.Used / 1GB, 1)
    $freeGB = [math]::Round($_.Free / 1GB, 1)
    "$($_.Name): ${usedGB} GB used / ${freeGB} GB free"
  }
  $uptime = (Get-Date) - $os.LastBootUpTime
  $uptimeStr = '{0}d {1}h {2}m' -f [int]$uptime.TotalDays, $uptime.Hours, $uptime.Minutes
  Write-Host ''
  Write-Host '  󰉉   System Info' -ForegroundColor Cyan
  Write-Host '  ───────────────────────────────────────' -ForegroundColor DarkGray
  Write-Host ("  󰍛    CPU:    {0}" -f $cpu.Name)                         -ForegroundColor White
  Write-Host ("  󰜉    GPU:    {0}" -f $gpu.Name)                         -ForegroundColor White
  Write-Host ("  󰖩    RAM:    {0} / {1} GB" -f $ramUsedGB, $ramTotalGB)    -ForegroundColor White
  foreach ($d in $disks) {
    Write-Host ("  󰛼    {0}" -f $d)                                -ForegroundColor White
  }
  Write-Host ("  󰖯    Uptime: {0}" -f $uptimeStr)                        -ForegroundColor White
  Write-Host ("      Windows Build {0} ({1})" -f $os.BuildNumber, $os.Caption) -ForegroundColor White
  Write-Host ('  󰛶    Hostname: {0}' -f $env:COMPUTERNAME)               -ForegroundColor White
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
  }
  else {
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
      }
      catch {
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

function weather {
    curl.exe -sS --max-time 10 wttr.in/narshingdi
}

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      8. EASTER EGGS & FUN                                  ║
# ╚══════════════════════════════════════════════════════════════════════════╝
function matrix {
  $width = $Host.UI.RawUI.WindowSize.Width
  $height = $Host.UI.RawUI.WindowSize.Height - 1
  $drops = @()
  1..$width | ForEach-Object { $drops += (Get-Random -Minimum 0 -Maximum $height) }
  Write-Host "Press Ctrl+C to exit" -ForegroundColor Green
  while ($true) {
    for ($i = 0; $i -lt $width; $i++) {
      if ($drops[$i] -lt $height) {
        Write-Host -NoNewline -ForegroundColor Green ([char](Get-Random -Minimum 33 -Maximum 126))
        Write-Host -NoNewline -ForegroundColor Black " "
      }
      else {
        Write-Host -NoNewline "  "
      }
      $drops[$i]++
      if ($drops[$i] -gt $height) { $drops[$i] = 0 }
    }
    Write-Host ""
    Start-Sleep -Milliseconds 50
  }
}

function inh {
    function Write-InhRow {
        param([string]$Key, [string]$Description, [ConsoleColor]$KeyColor = 'White')
        Write-Host '  │ ' -NoNewline -ForegroundColor DarkGray
        Write-Host ($Key.PadRight(13)) -NoNewline -ForegroundColor $KeyColor
        Write-Host $Description.PadRight(43) -NoNewline -ForegroundColor White
        Write-Host '│' -ForegroundColor DarkGray
    }
    function Write-InhSection {
        param([string]$Title, [ConsoleColor]$Color = 'DarkGray')
        $innerWidth = 60
        $label = " $Title "
        $remaining = [Math]::Max(0, $innerWidth - $label.Length)
        $left = [Math]::Floor($remaining / 2)
        $right = $remaining - $left
        Write-Host (('  ┌' + ('─' * $left) + $label + ('─' * $right) + '┐')) -ForegroundColor $Color
    }
    function Write-InhFooter {
        Write-Host '  └────────────────────────────────────────────────────────────┘' -ForegroundColor DarkGray
        Write-Host ''
    }

    Write-Host ''
    Write-Host '  ╔════════════════════════════════════════════════════════════╗' -ForegroundColor Cyan
    Write-Host '  ║             POWERSHELL PROFILE — COMMAND CHEATSHEET        ║' -ForegroundColor Cyan
    Write-Host '  ╚════════════════════════════════════════════════════════════╝' -ForegroundColor Cyan

    Write-InhSection 'NAVIGATION' Yellow
    Write-InhRow 'cd' 'Fuzzy jump with zoxide' Yellow
    Write-InhRow 'up [n]' 'Move up N directories' Yellow
    Write-InhFooter

    Write-InhSection 'FILES & EDITORS' Magenta
    Write-InhRow 'y' 'Open Yazi file manager' Magenta
    Write-InhRow 'edit [path]' 'Choose Microsoft Edit, VS Code, or Neovim' Magenta
    Write-InhRow 'touch' 'Create file or update timestamp' Green
    Write-InhRow 'yc' 'Copy file contents to clipboard' Green
    Write-InhRow 'ac' 'Append interactively' Green
    Write-InhRow 'ls / ll / la / lla / lt' 'Eza listings and tree view' Blue
    Write-InhRow 'cat' 'Use bat for syntax-highlighted output' Blue
    Write-InhFooter

    Write-InhSection 'GIT' Red
    Write-InhRow 'gs / ga / gc / gp' 'Status / add / commit / push' Red
    Write-InhRow 'gl / gco / gd' 'Graph log / checkout / diff' Red
    Write-InhFooter

    Write-InhSection 'SYSTEM & UTILITIES' Cyan
    Write-InhRow 'sysinfo' 'System snapshot' Cyan
    Write-InhRow 'proc [name]' 'Fuzzy process viewer / killer' Cyan
    Write-InhRow 'port [number]' 'Show processes listening on TCP port' Cyan
    Write-InhRow 'weather' 'Get local weather via wttr.in' Cyan
    Write-InhRow 'ccd' 'Copy current directory path' Gray
    Write-InhRow 'which / reload' 'Command source / reload profile' Gray
    Write-InhFooter

    Write-InhSection 'COREUTILS COMMANDS' Blue
    $coreutilsCommands = @()
    if (Get-Variable -Name '__COREUTILS__' -Scope Script -ErrorAction SilentlyContinue) {
        $coreutilsCommands = @($script:__COREUTILS__ | Sort-Object)
    }
    if ($coreutilsCommands.Count -gt 0) {
        $line = '  │ '
        foreach ($name in $coreutilsCommands) {
            $token = "$name  "
            if (($line.Length + $token.Length) -gt 61) {
                Write-Host ($line.PadRight(63) + '│') -ForegroundColor Blue
                $line = '  │ '
            }
            $line += $token
        }
        if ($line.Trim() -ne '│') { Write-Host ($line.PadRight(63) + '│') -ForegroundColor Blue }
    } else {
        Write-InhRow 'Coreutils' 'Command list not initialized yet' Blue
    }
    Write-InhFooter
    Write-Host '  Tip: type inh or ing to show this reference.' -ForegroundColor DarkGray
    Write-Host ''
}
function ing { inh }

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      9. MODULES & COMPLETERS                             ║
# ╚══════════════════════════════════════════════════════════════════════════╝
# ComfyUI Argument Completer
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

# Winget CommandNotFound Integration
Import-Module -Name Microsoft.WinGet.CommandNotFound

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      10. COREUTILS INLINED OPTIMIZER                     ║
# ╚══════════════════════════════════════════════════════════════════════════╝
# DO NOT MODIFY -- coreutils -- 60b36fc6-2d59-49df-be51-28dd2f4c3c9a
$script:__COREUTILS__ = [System.Collections.Generic.HashSet[string]]::new(
    [string[]]@('arch','b2sum','base32','base64','basename','basenc','cat','cksum','comm','cp','csplit','cut','date','df','dirname','du','echo','env','expr','factor','false','find','fmt','fold','grep','head','hostname','join','la','link','ln','ls','md5sum','mkdir','mktemp','mv','nl','nproc','numfmt','od','paste','pathchk','pr','printenv','printf','ptx','pwd','readlink','realpath','rm','rmdir','seq','sha1sum','sha224sum','sha256sum','sha384sum','sha512sum','shuf','sleep','sort','split','stat','sum','tac','tail','tee','test','touch','tr','true','truncate','tsort','unexpand','uniq','unlink','uptime','wc','xargs','yes'),
    [System.StringComparer]::OrdinalIgnoreCase
)
$script:__COREUTILS_FAST_SKIP__ = [regex]::new(
    '\b(?:' + ($script:__COREUTILS__ -join '|') + ')\b',
    [System.Text.RegularExpressions.RegexOptions]::Compiled -bor `
        [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
)
$script:__COREUTILS_CMD_PREDICATE__ = [System.Func[System.Management.Automation.Language.Ast, bool]] {
    param($n) $n -is [System.Management.Automation.Language.CommandAst]
}
$script:__COREUTILS_ARG_SPECIAL__ = [char[]] @("'", '"', '`', '$')

function global:__coreutils_q {
    param($s)
    '"' + (([string]$s) -replace '(\\\\*)"', '$1$1\\"' -replace '(\\\\+)$', '$1$1') + '"'
}

$script:__COREUTILS_ARG_RX__ = [regex]::new(
    "'((?:[^']|'')*)'|""((?:[^""``]|""""|``.)*)""|``(.)|([^'""``]+)",
    [System.Text.RegularExpressions.RegexOptions]::Compiled
)
$script:__COREUTILS_ARG_EVAL__ = [System.Text.RegularExpressions.MatchEvaluator] {
    param($m)
    if ($m.Groups[1].Success) {
        $body = $m.Groups[1].Value.Replace("''", "'")
        if ($body -match '^(.*?)(\\\\+)$') {
            return '"' + ($matches[1] -replace '(\\\\*)"', '$1$1\\"') + '"' + $matches[2]
        }
        return '"' + ($body -replace '(\\\\*)"', '$1$1\\"') + '"'
    }
    if ($m.Groups[2].Success) {
        $body = $m.Groups[2].Value.
        Replace('`"', '"').
        Replace("``'", "'").
        Replace('""', '"')
        $body = $ExecutionContext.InvokeCommand.ExpandString($body)
        if ($body -match '^(.*?)(\\\\+)$') {
            return '"' + ($matches[1] -replace '(\\\\*)"', '$1$1\\"') + '"' + $matches[2]
        }
        return '"' + ($body -replace '(\\\\*)"', '$1$1\\"') + '"'
    }
    if ($m.Groups[3].Success) {
        $c = $m.Groups[3].Value
        if ($c -eq '"') { return '\\"' }
        return '"' + $c + '"'
    }
    return $ExecutionContext.InvokeCommand.ExpandString($m.Groups[4].Value)
}

$script:__COREUTILS_CMD_DIR_TEST__ = 0
function PSConsoleHostReadLine {
    [System.Diagnostics.DebuggerHidden()]
    param()
    # Delegate input/history lifecycle to Atuin first. Calling this as the first
    # executable statement preserves the previous command's $? for Atuin's hook.
    # Coreutils rewriting happens only after Atuin has captured the user's input.
    $line = Atuin\PSConsoleHostReadLine
    if (-not $script:__COREUTILS_FAST_SKIP__.IsMatch($line)) {
        return $line
    }
    if ($script:__COREUTILS_CMD_DIR_TEST__ -eq 0) {
        $script:__COREUTILS_CMD_DIR_TEST__ = 1
        if (Test-Path -LiteralPath 'C:\Program Files\coreutils\cmd\\' -PathType Container -ErrorAction Ignore) {
            $script:__COREUTILS_CMD_DIR_TEST__ = 2
        }
    }
    if ($script:__COREUTILS_CMD_DIR_TEST__ -ne 2) {
        return $line
    }
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($line, [ref]$null, [ref]$null)
    $commands = $ast.FindAll($script:__COREUTILS_CMD_PREDICATE__, $true)
    if ($commands.Count -gt 1) {
        $commands = [System.Collections.Generic.List[object]]::new($commands)
        $commands.Reverse()
    }
    foreach ($cmd in $commands) {
        $name = $cmd.GetCommandName()
        if (!$name) { continue }
        $baseName = $name
        if ($name.EndsWith('.exe') -or $name.EndsWith('.cmd')) {
            $baseName = $name.Substring(0, $name.Length - 4)
        }
        if (!$script:__COREUTILS__.Contains($baseName)) { continue }

        # Preserve intentional PowerShell function overrides (Eza and bat).
        # The Coreutils line rewriter otherwise hijacks these before command resolution.
        if ($baseName -in @('ls', 'la', 'cat') -and
            (Get-Command $baseName -CommandType Function -ErrorAction SilentlyContinue)) {
            continue
        }

        $cmdElement = $cmd.CommandElements[0]
        $start = $cmdElement.Extent.StartOffset
        $end = $cmdElement.Extent.EndOffset
        $replacement = "& 'C:\Program Files\coreutils\cmd\\"
        switch ($baseName) {
            'la' { $replacement += "ls.cmd' --color=auto -AFhl" }
            'ls' { $replacement += "ls.cmd' --color=auto" }
            default { $replacement += "$baseName.cmd'" }
        }

        $argsStart = $end
        $argsEnd = $cmd.Extent.EndOffset
        $rewrittenArgs = ''
        $elements = $cmd.CommandElements
        $count = $elements.Count
        $i = 1
        while ($i -lt $count) {
            $first = $elements[$i]
            $wordStart = $first.Extent.StartOffset
            $wordEnd = $first.Extent.EndOffset
            $merged = $false
            while ($i + 1 -lt $count -and $elements[$i + 1].Extent.StartOffset -eq $wordEnd) {
                $i++
                $wordEnd = $elements[$i].Extent.EndOffset
                $merged = $true
            }
            $source = $line.Substring($wordStart, $wordEnd - $wordStart)
            $rewrittenArgs += $line.Substring($argsStart, $wordStart - $argsStart)
            $argsStart = $wordEnd
            if ($source.IndexOfAny($script:__COREUTILS_ARG_SPECIAL__) -lt 0) {
                $rewrittenArgs += $source
                $i++
                continue
            }
            if (-not $merged -and
                ($first -is [System.Management.Automation.Language.VariableExpressionAst] -or
                $first -is [System.Management.Automation.Language.ExpandableStringExpressionAst] -or
                $first -is [System.Management.Automation.Language.MemberExpressionAst])) {
                $rewrittenArgs += '(__coreutils_q ' + $source + ')'
                $i++
                continue
            }
            $windowsQuoted = $script:__COREUTILS_ARG_RX__.Replace($source, $script:__COREUTILS_ARG_EVAL__)
            $rewrittenArgs += "'" + $windowsQuoted.Replace("'", "''") + "'"
            $i++
        }
        $rewrittenArgs += $line.Substring($argsStart, $argsEnd - $argsStart)
        $line = $line.Substring(0, $start) + $replacement + $rewrittenArgs + $line.Substring($argsEnd)
    }
    return $line
}

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                      11. PROFILE SUMMARY & TIMER                           ║
# ╚══════════════════════════════════════════════════════════════════════════╝
$_profileTimer.Stop()
$_ms = $_profileTimer.ElapsedMilliseconds
$_color = if ($_ms -lt 500) { 'Green' } elseif ($_ms -lt 1500) { 'Yellow' } else { 'Red' }
Write-Host "  Profile loaded in ${_ms}ms" -ForegroundColor $_color
Remove-Variable _profileTimer, _ms, _color
