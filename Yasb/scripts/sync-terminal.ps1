$log = "C:\Users\{Username}\.config\yasb\terminal_sync.log"

# Ensure the log directory exists
$logDir = Split-Path -Parent $log
if (-not (Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}

# 1. Kill Tacky Borders first to release file locks on config.yaml
try {
    Get-Process -Name "tacky-borders" -ErrorAction SilentlyContinue | Stop-Process -Force
    Start-Sleep -Milliseconds 200 # Brief pause to ensure file handle releases completely
} catch {
    "[{0}] ERROR (tacky-borders stop): {1}" -f (Get-Date), $_ | Out-File -FilePath $log -Append
}

# Define mappings: [Name, Source (origin in cache), Destination (save_as)]
$syncMappings = @(
    @{ Name = "Windows Terminal"; Src = "C:\Users\{Username}\.cache\wal\Pwsh"; Dst = "C:\Users\{Username}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" },
    @{ Name = "Oh-My-Posh"; Src = "C:\Users\{Username}\.cache\wal\omp"; Dst = "C:\Users\{Username}\.config\oh-my-posh\pywal.omp.json" },
    @{ Name = "Vivaldi CSS"; Src = "C:\Users\{Username}\.cache\wal\vivaldi"; Dst = "C:\Essantials\Documents\Code\Win-11-Config\Vivaldi\Themes\Custom Ui mod\Vivaldi.css" },
    @{ Name = "Yazi"; Src = "C:\Users\{Username}\.cache\wal\yazi"; Dst = "C:\Users\{Username}\.config\yazi\theme.toml" },
    @{ Name = "Zed"; Src = "C:\Users\{Username}\.cache\wal\zed"; Dst = "C:\Users\{Username}\AppData\Roaming\Zed\themes\pywal.json" },
    @{ Name = "FilePilot"; Src = "C:\Users\{Username}\.cache\wal\file_pilot.json"; Dst = "C:\Users\{Username}\AppData\Roaming\Voidstar\FilePilot\FPilot-Config.json" },
    @{ Name = "Fastfetch"; Src = "C:\Users\{Username}\.cache\wal\fastfetch.jsonc"; Dst = "C:\Users\{Username}\.config\fastfetch\config.jsonc" },
    @{ Name = "Nilesoft Shell"; Src = "C:\Users\{Username}\.cache\wal\theme.nss"; Dst = "C:\Program Files\Nilesoft Shell\imports\theme.nss" },
    @{ Name = "Flow Launcher"; Src = "C:\Users\{Username}\.cache\wal\flow_launcher.xaml"; Dst = "C:\Users\{Username}\AppData\Roaming\FlowLauncher\Themes\Pywal.xaml" },
    @{ Name = "Tacky Borders"; Src = "C:\Users\{Username}\.cache\wal\tacky_borders.yaml"; Dst = "C:\Users\{Username}\.config\tacky-borders\config.yaml" },
    @{ Name = "Wezterm"; Src = "C:\Users\{Username}\.cache\wal\wezterm"; Dst = "C:\Users\{Username}\.config\wezterm\wezterm.lua" }
)

# Loop through and process each file mapping (Errors and Warnings only)
foreach ($map in $syncMappings) {
    try {
        if (Test-Path -Path $map.Src) {
            # Ensure destination directory exists before copying
            $destDir = Split-Path -Parent $map.Dst
            if (-not (Test-Path -Path $destDir)) {
                New-Item -ItemType Directory -Path $destDir -Force | Out-Null
            }

            Copy-Item -Path $map.Src -Destination $map.Dst -Force
        } else {
            "[{0}] WARNING: Source missing for {1} ({2})" -f (Get-Date), $map.Name, $map.Src | Out-File -FilePath $log -Append
        }
    } catch {
        "[{0}] ERROR ({1}): {2}" -f (Get-Date), $map.Name, $_ | Out-File -FilePath $log -Append
    }
}

# 2. Restart Tacky Borders after files have safely copied
try {
    Start-Process -FilePath "C:\Users\{Username}\Downloads\Programs\tacky-borders.exe"
} catch {
    "[{0}] ERROR (tacky-borders start): {1}" -f (Get-Date), $_ | Out-File -FilePath $log -Append
}
