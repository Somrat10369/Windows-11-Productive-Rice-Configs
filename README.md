# Windows 11 Power User Collection

> A curated, battle-tested collection of 200+ tools for Windows 11 — covering system optimization, developer workflows, visual customization, privacy, and beyond. Mostly Keyboard driven workflow with cappuccin vibes.

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Windows%2011%20%7C%2010-blue)](https://www.microsoft.com/windows)
[![Tools](https://img.shields.io/badge/Tools-200%2B-purple)](./Useful_Programms.md)

---

## Quick Links

- [Complete Tool Catalog](./Useful_Programms.md) — All 200+ tools with descriptions and direct download links
- [Quick Start](#quick-start) — Install essentials in minutes
- [Gallery](#gallery) — Visual showcase

---

## Gallery

![Windows 11 Ultimate Setup](Assets/Windows.png)
![Terminal](Assets/Terminal.png)
![Browser](Assets/Vivaldi.png)
![Todo list](Assets/Yasb_Widget_Showcase_Todo.png)
![Enhanced Context Menu](Assets/Nilesoft_Shell.png)
![Cli file manager](Assets/Yazi.png)
![Downloader Cli](Assets/Surge_Cli.png)
![Vs Code](Assets/Vscode.png)
![System Monitor](Assets/Btop.png)
![File Pilot](Assets/File_Pilot.png)
![Neovide](Assets/Neovide.png)
![Notepad](Assets/Notepad++.png)
![Torrenter](Assets/Qbtorrent.png)
![Status Bar](Assets/Yasb_Bar_Yasb_Bar_20260406_004705.png)
![Local Private Ai](Assets/Yasb_Widget_Showcase_Ai_Chat.png)
![Status](Assets/Yasb_Widget_Showcase_Memory.png)
![Winver](Assets/Winver.png)
![Sign off](Assets/Sign_Off.png)
![Notes](Assets/Yasb_Widget_Showcase_Notes.png)
![Flow Launcher](Assets/Flow_Launcher.png)
![Wallpaper](Assets/Wallpaper_Selection.png)
![Msi After Burner](Assets/Msi_After_Burner.png)

---


## Quick Start

### Prerequisites

- Windows 11 (Windows 10 compatible for most tools)
- Administrator access for system modifications

### Method 1: Winget (Recommended)

```powershell
winget install Microsoft.PowerToys
winget install Microsoft.PowerShell
winget install Git.Git
winget install Docker.DockerDesktop
winget install Microsoft.VisualStudioCode
winget install voidtools.Everything
winget install Flow-Launcher.Flow-Launcher
winget install Obsidian.Obsidian
winget install qBittorrent.qBittorrent
winget install Neovim.Neovim
...

```

### Method 2: UniGetUI (GUI)

1. Download and install **[UniGetUI](https://github.com/marticliment/UniGetUI/releases/latest)**
2. Search for any tool by name across winget, Scoop, Chocolatey, and more
3. Select and install — UniGetUI handles everything

### Method 3: Chris Titus WinUtil

```powershell
# Run in an elevated PowerShell window
irm christitus.com/win | iex
```

Select desired tweaks and installs from the GUI. See [christitustech/winutil](https://github.com/ChrisTitusTech/winutil) for details.

---

# Quick Start Guide — Star Tools

> Setup instructions for the core tools in this collection. Each tool has its config stored in its own folder in this repo.

---

## Table of Contents

1. [Atuin](#atuin)
2. [Claude](#claude)
3. [Discord — Vencord](#discord--vencord)
4. [Fastfetch](#fastfetch)
5. [File Pilot](#file-pilot)
6. [Flow Launcher](#flow-launcher)
7. [GlazeWM](#glazewm)
8. [Nilesoft Shell](#nilesoft-shell)
9. [Notepad++](#notepad)
10. [Oh-My-Posh](#oh-my-posh)
11. [QBittorrent](#qbittorrent)
12. [Tacky Borders](#tacky-borders)
13. [Terminal](#terminal)
14. [UniGetUI](#unigetui)
15. [Vivaldi](#vivaldi)
16. [VS Code](#vs-code)
17. [W11 Cursor Dark Smooth](#w11-cursor-dark-smooth)
18. [Wallpaper](#wallpaper)
19. [Win 11 Themes](#win-11-themes)
20. [Windhawk](#windhawk)
21. [YASB](#yasb)
22. [Yazi](#yazi)

---

## Atuin

**Shell history sync and search — replaces Ctrl+R.**

📥 [atuin.sh](https://atuin.sh/) · Config: `Atuin.`

```powershell
winget install atuinsh.atuin
```

Add to PowerShell profile:

```powershell
Invoke-Expression (& atuin init powershell | Out-String)
```

Import existing history on first run — Atuin will prompt automatically.

---

## Claude

**Anthropic's AI assistant — desktop app.**

📥 [claude.ai/download](https://claude.ai/download) · Config: `Claude.`

1. Download and install the desktop app
2. Sign in with your Anthropic account or better, use it with ollama
  ```powershell
  ollama launch claude --config
  ```
3. Optional: enable **web search**, **memory**, and **extended thinking** from Settings

> The desktop app supports global hotkey access and system prompt customization under Settings → Advanced.

---

## Discord — Vencord

**Discord with Vencord client mod for themes, plugins, and privacy.**

📥 [vencord.dev](https://vencord.dev/download/) · Config: `Discord - Vencord.`

1. Install Discord normally: [discord.com/download](https://discord.com/download)
2. Download and run the **Vencord Installer**
3. Select **Install** → point to your Discord install
4. Launch Discord — Vencord loads automatically

Apply themes and plugins from **Settings → Vencord → Themes / Plugins**.

Copy config from `Discord - Vencord.` to:

```
%APPDATA%\Vencord\settings\
```

---

## Fastfetch

**Fast, configurable system info fetcher.**

📥 [github.com/fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch/releases/latest) · Config: `Fastfetch.`

```powershell
winget install fastfetch-cli.fastfetch
```

Copy config from `Fastfetch.` to:

```
%USERPROFILE%\.config\fastfetch\config.jsonc
```

Run with:

```powershell
fastfetch
```

---

## File Pilot

**Lightweight, high-performance file manager. Under 2MB, multi-pane, tabbed.**

📥 [filepilot.co](https://filepilot.co/) · Config: `File Pilot.`

1. Download the portable `.exe` from the site
2. Place it wherever you want — no install needed
3. Launch and configure panes, keybindings, and theme from **Settings**

Copy config from `File Pilot.` to:

```
%APPDATA%\FilePilot\
```

---

## Flow Launcher

**App launcher for Windows — Everything search, calculator, shell, plugins.**

📥 [flowlauncher.com](https://www.flowlauncher.com/) · Config: `Flow Launcher.`

```powershell
winget install Flow-Launcher.Flow-Launcher
```

Copy config from `Flow Launcher.` to:

```
%APPDATA%\FlowLauncher\Settings\
```

Set **Everything** as the default file search plugin for instant results. Recommended plugins: `Everything`, `Calculator`, `Shell`, `Browser Bookmarks`.

Hotkey default: `Alt + Space`

---

## GlazeWM

**Tiling window manager for Windows inspired by i3.**

📥 [github.com/glzr-io/glazewm](https://github.com/glzr-io/glazewm/releases/latest) · Config: `Glazewm.`

```powershell
winget install glzr-io.glazewm
```

Copy config from `Glazewm.` to:

```
%USERPROFILE%\.glaze-wm\config.yaml
```

Launch GlazeWM — it reads the config on startup. Add it to **startup** via Task Scheduler or HiBit Startup Manager.

Key defaults (configurable):

| Action | Key |
| ------ | --- |
| Focus left/right/up/down | `Alt + H/L/K/J` |
| Move window | `Alt + Shift + H/L/K/J` |
| Close window | `Alt + Q` |
| Toggle floating | `Alt + T` |

---

## Nilesoft Shell

**Context menu extender for Windows File Explorer.**

📥 [nilesoft.org](https://nilesoft.org/download) · Config: `Nilesoft Shell.`

1. Download and run the installer (requires admin)
2. Copy imports and config from `Nilesoft Shell.` to:

```
C:\Program Files\Nilesoft Shell\imports\
```

3. Right-click any file or folder to see the extended menu immediately — no restart needed

Edit `shell.nss` to add/remove/reorder entries. Changes apply live.

---

## Notepad++

**Lightweight, extensible text editor.**

📥 [notepad-plus-plus.org](https://notepad-plus-plus.org/downloads/) · Config: `Notepad++.`

```powershell
winget install Notepad++.Notepad++
```

Copy config from `Notepad++.` to:

```
%APPDATA%\Notepad++\
```

Includes: theme, language definitions, and plugin settings.

---

## Oh-My-Posh

**Prompt theme engine for PowerShell and any other shell.**

📥 [ohmyposh.dev](https://ohmyposh.dev/docs/installation/windows) · Config: `Oh-My-Posh.`

```powershell
winget install JanDeDobbeleer.OhMyPosh
```

Copy the theme from `Oh-My-Posh.` to:

```
%USERPROFILE%\.config\oh-my-posh\
```

Add to your PowerShell profile (`notepad $PROFILE`):

```powershell
oh-my-posh init pwsh --config "$env:USERPROFILE\.config\oh-my-posh\theme.omp.json" | Invoke-Expression
```

Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) and set it in your terminal for icons to render correctly.

---

## QBittorrent

**Free, open-source BitTorrent client. No ads, no bundled software.**

📥 [qbittorrent.org](https://www.qbittorrent.org/download) · Config: `Qbtorrent.`

```powershell
winget install qBittorrent.qBittorrent
```

Copy config from `Qbtorrent.` to:

```
%APPDATA%\qBittorrent\
```

Includes: category settings, download paths, and UI preferences.

---

## Tacky Borders

**Colored window borders for focused/unfocused windows — Hyprland-style.**

📥 [github.com/lukeyou05/tacky-borders](https://github.com/lukeyou05/tacky-borders/releases/latest) · Config: `Tacky-Borders.`

1. Download the `.exe` from releases
2. Copy config from `Tacky-Borders.` to:

```
%USERPROFILE%\.config\tacky-borders\config.yaml
```

3. Run `tacky-borders.exe` — add to startup for persistence

Edit `config.yaml` to set border colors, width, and active/inactive behavior.

---

## Terminal

**Windows Terminal — the modern tabbed terminal host.**

📥 [apps.microsoft.com](https://apps.microsoft.com/detail/9n0dx20hk701) · Config: `Terminal.`

```powershell
winget install Microsoft.WindowsTerminal
```

Copy config from `Terminal.` to:

```
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

Includes: color scheme, font, tab settings, default profile (PowerShell 7 / Terax).

---

## UniGetUI

**GUI frontend for winget, Scoop, Chocolatey, pip, npm, and cargo.**

📥 [github.com/marticliment/UniGetUI](https://github.com/marticliment/UniGetUI/releases/latest) · Config: `Unigetui.`

```powershell
winget install MartiCliment.UniGetUI
```

On first launch, UniGetUI auto-detects installed package managers. Use the **Packages** tab to install, update, or remove software across all managers from one interface.

Export your installed package list from **Settings → Backup** for easy reinstall on a new machine.

---

## Vivaldi

**Chromium browser built for power users — tab stacking, tiling, built-in mail and calendar.**

📥 [vivaldi.com](https://vivaldi.com/download/) · Config: `Vivaldi.`

```powershell
winget install VivaldiTechnologies.Vivaldi
```

Sync settings via **Vivaldi Sync** (built-in) — sign in to restore your config on any machine.

To manually copy config:

```
%LOCALAPPDATA%\Vivaldi\User Data\Default\
```

Recommended settings: enable **Tab Stacking**, set **Speed Dials**, configure **Keyboard Shortcuts** from `Vivaldi.`.

---

## VS Code

**Microsoft's open-source code editor.**

📥 [code.visualstudio.com](https://code.visualstudio.com/Download) · Config: `Vscode.`

```powershell
winget install Microsoft.VisualStudioCode
```

Copy config from `Vscode.` to:

```
%APPDATA%\Code\User\settings.json
%APPDATA%\Code\User\keybindings.json
```

Install extensions from the included list:

```powershell
# From the Vscode. folder, run:
cat extensions.txt | xargs -I{} code --install-extension {}
```

Or install manually from the Extensions panel (`Ctrl+Shift+X`).

---

## W11 Cursor Dark Smooth

**Dark, smooth animated cursor theme for Windows 11.**

📥 Source in `W11 Cursor Dark Smooth.` · Config: `W11 Cursor Dark Smooth.`

1. Open the `W11 Cursor Dark Smooth.` folder
2. Right-click `install.inf` → **Install**
3. Go to **Settings → Bluetooth & devices → Mouse → Additional mouse settings → Pointers**
4. Select **W11 Cursor Dark Smooth** from the scheme dropdown
5. Click **Apply**

---

## Wallpaper

**Curated wallpaper collection.**

📁 Location: `Wallpaper.`

Browse the `Wallpaper.` folder and set your preferred image via:

**Settings → Personalization → Background → Browse photos**

Or right-click any image → **Set as desktop background**.

---

## Win 11 Themes

**Custom visual themes for Windows 11 (requires UltraUxThemePatcher).**

📥 [UltraUxThemePatcher](https://melloware.com/ultrauxthemepatcher/) required · Config: `Win 11 Themes.`

1. Install **UltraUxThemePatcher** first and restart
2. Copy `.msstyles` files from `Win 11 Themes.` to:

```
C:\Windows\Resources\Themes\
```

3. Go to **Settings → Personalization → Themes**
4. Select the installed theme

> Without UltraUxThemePatcher, Windows will reject unsigned themes.

---

## Windhawk

**Mod platform for Windows — install customizations like extensions.**

📥 [windhawk.net](https://windhawk.net/) · Config: `Windhawk.`

```powershell
winget install RaMMicHaeL.Windhawk
```

After install, open Windhawk and browse the mod catalog. Recommended mods:

- **Taskbar Clock Customization** — custom date/time format
- **Windows 11 Taskbar Styler** — restyle the taskbar
- **Explorer Taskbar Tweaker** — advanced taskbar behavior
- **Disable Windows Copilot** — remove Copilot button

Mod settings are saved in Windhawk — no manual config file copy needed.

---

## YASB

**Yet Another Status Bar — customizable Windows status bar.**

📥 [github.com/amnweb/yasb](https://github.com/amnweb/yasb/releases/latest) · Config: `Yasb.`

```powershell
winget install AmN.yasb
```

Copy config from `Yasb.` to:

```
%USERPROFILE%\.yasb\
```

Includes: `config.yaml` (bar layout, widgets) and `styles.css` (visual styling).

Launch YASB — it reads both files on startup. Reload config live with the tray icon → **Reload**.

Pairs best with **GlazeWM** — YASB can display the active workspace name directly from GlazeWM.

---

## Yazi

**Blazing-fast terminal file manager written in Rust.**

📥 [github.com/sxyazi/yazi](https://github.com/sxyazi/yazi/releases/latest) · Config: `Yazi.`

```powershell
winget install sxyazi.yazi
```

Copy config from `Yazi.` to:

```
%APPDATA%\yazi\config\
```

Includes: `yazi.toml`, `keymap.toml`, `theme.toml`.

Add a shell wrapper for directory-jumping on exit (add to PowerShell profile):

```powershell
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Raw $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.ProviderPath) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}
```

Launch with `y` — exit with `q` and your terminal will follow to the last directory.

---

*All configs in this repo are drop-in replacements. Back up your existing configs before copying.*

## Security Best Practices

- Download only from the official links listed in [Useful_Programms.md](./Useful_Programms.md)
- Verify code signatures where available
- Prefer portable versions to avoid unnecessary registry modifications
- Use **HiBit Startup Manager** to review what runs at boot after installs

---

## Contributing

1. **Report issues** — broken links, outdated tools, missing entries
2. **Suggest tools** — open an issue with name, description, and official link
3. **Improve docs** — fix typos, add usage guides, update configs

Please follow the existing format and link only to official sources.

---

# Acknowledgements

## Benchmarking & Hardware Info

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **3DMark** | Futuremark / UL Technologies | Steam: [store.steampowered.com/app/223850/3DMark/](https://store.steampowered.com/app/223850/3DMark/) |
| **Heaven Benchmark** | Unigine | [benchmark.unigine.com](https://benchmark.unigine.com/heaven) |
| **CrystalDiskMark** | Fredrik Ljungström | [crystalmark.info](https://crystalmark.info/en/software/crystaldiskmark/) |
| **CrystalDiskInfo** | Fredrik Ljungström | [crystalmark.info](https://crystalmark.info/en/software/crystaldiskinfo/) |
| **CPU-Z** | CPUID | [cpuid.com](https://www.cpuid.com/softwares/cpu-z.html) |
| **HWiNFO** | HWInfo Team | [hwinfo.com](https://www.hwinfo.com/download/) |
| **MSI Afterburner** | MSI | [msi.com](https://www.msi.com/Landing/afterburner/graphics-cards) |
| **RivaTuner Statistics Server** | Guru3D | [guru3d.com](https://www.guru3d.com/files-details/rtss-rivatuner-statistics-server-download.html) |
| **Samsung Magician** | Samsung Electronics | [samsung.com](https://semiconductor.samsung.com/consumer-storage/magician/) |

---

## System Utilities & Tweaks

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Display Driver Uninstaller (DDU)** | Gregor Brown / Guru3D | [guru3d.com](https://www.guru3d.com/files-details/display-driver-uninstaller-download.html) |
| **Revo Uninstaller** | Revo Software | [revouninstaller.com](https://www.revouninstaller.com/revo-uninstaller-free-download/) |
| **HiBit Startup Manager** | Hibit Soft | [hibitsoft.ir](https://www.hibitsoft.ir/StartupManager.html) |
| **QuickStartup** | Glary Software | [glarysoft.com](https://www.glarysoft.com/quick-startup/) |
| **WinAero Tweaker** | Stief母猫 (StiefMomu) | [winaerotweaker.com](https://winaerotweaker.com/) |
| **Windhawk** | Windhawk Team | [windhawk.net](https://windhawk.net/) |
| **UltraUxThemePatcher** | MellowAre | [melloware.com](https://melloware.com/ultrauxthemepatcher/) |
| **PowerToys** | Microsoft Corporation | [github.com/microsoft/PowerToys](https://github.com/microsoft/PowerToys/releases/latest) (MIT License) |
| **GlazeWM** | glzr-io / GlazeWM Team | [github.com/glzr-io/glazewm](https://github.com/glzr-io/glazewm/releases/latest) (MIT License) |
| **YASB Reborn** | amnweb (AmnWeb) | [github.com/amnweb/yasb](https://github.com/amnweb/yasb/releases/latest) |
| **Tacky Borders** | lukeyou05 | [github.com/lukeyou05/tacky-borders](https://github.com/lukeyou05/tacky-borders/releases/latest) |
| **Rainmeter** | Rainmeter Team | [rainmeter.net](https://www.rainmeter.net/) |
| **Fluent Flyout** | ModernFlyouts Community | [github.com/ModernFlyouts-Community/ModernFlyouts](https://github.com/ModernFlyouts-Community/ModernFlyouts/releases/latest) |
| **Fluent Weather** | Microsoft Store | [apps.microsoft.com](https://apps.microsoft.com/detail/9pfw4gq87nt5) |
| **Process Explorer** | Microsoft Sysinternals | [learn.microsoft.com](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer) |
| **Everything** | Void Tools | [voidtools.com](https://www.voidtools.com/downloads/) |
| **Everything Toolbar** | srwi | [github.com/srwi/EverythingToolbar](https://github.com/srwi/EverythingToolbar/releases/latest) |
| **Open RGB** | OpenRGB | [openrgb.org](https://openrgb.org/releases.html) |
| **Mac OS Dock** | LalithK90 | [github.com/LalithK90/macOS-Dock-Windows](https://github.com/LalithK90/macOS-Dock-Windows) |

---

## File Management

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **FilePilot** | FilePilot Team | [filepilot.co](https://filepilot.co/) |
| **Dropshelf** | 0x-raafet (Rafaat) | [github.com/0x-raafet/Dropshelf](https://github.com/0x-raafet/Dropshelf/releases/latest) |
| **Bulk Rename Utility** | Bulk Rename Utility Team | [bulkrenameutility.co.uk](https://www.bulkrenameutility.co.uk/Download.php) |
| **WizTree** | NirSoft | [diskanalyzer.com](https://www.diskanalyzer.com/download) |
| **TeraCopy** | CodeSector | [codesector.com](https://www.codesector.com/teracopy) |
| **NanaZip** | M2Team | [github.com/M2Team/NanaZip](https://github.com/M2Team/NanaZip/releases/latest) |
| **WinRAR** | RARLab | [rarlab.com](https://www.rarlab.com/download.htm) |
| **UltraISO** | E.Z.B Systems | [ezbsystems.com](https://www.ezbsystems.com/ultraiso/download.htm) |
| **ClipClip** | ClipClip Team | [clipclip.com](https://clipclip.com/download/) |

---

## Terminal & Shell

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **PowerShell 7 (pwsh)** | Microsoft Corporation | [github.com/PowerShell/PowerShell](https://github.com/PowerShell/PowerShell/releases/latest) (MIT License) |
| **MSYS2** | Microsoft Systems | [msys2.org](https://www.msys2.org/) |
| **Terax** | Crynta | [terax.dev](https://terax.dev/) |
| **Zellij** | Zellij Team | [github.com/zellij-org/zellij](https://github.com/zellij-org/zellij/releases/latest) (MIT License) |
| **Oh-My-Posh** | Oh My Posh Team | [ohmyposh.dev](https://ohmyposh.dev/docs/installation/windows) (MIT License) |
| **Ms_edit** | Microsoft Corporation | [github.com/microsoft/edit](https://github.com/microsoft/edit/releases/latest) |
| **NeoVim** | NeoVim Community | [neovim.io](https://neovim.io/) (Apache 2.0 License) |
| **Neovide** | Neovide Team | [neovide.dev](https://neovide.dev/installation.html) (MIT License) |
| **Vim Hero** | Vim Hero Team | [vim-hero.com](https://vim-hero.com/) |

---

## CLI Tools

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Git** | Git SCM | [git-scm.com](https://git-scm.com/download/win) (GPL License) |
| **GitHub CLI (`gh`)** | GitHub | [cli.github.com](https://cli.github.com/) (MIT License) |
| **Lazygit** | Jesse Duffield | [github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit/releases/latest) (MIT License) |
| **LazyDocker** | Jesse Duffield | [github.com/jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker/releases/latest) (MIT License) |
| **Yazi** | Yazi Team | [github.com/sxyazi/yazi](https://github.com/sxyazi/yazi/releases/latest) (MIT License) |
| **Eza** | Eza Community | [github.com/eza-community/eza](https://github.com/eza-community/eza/releases/latest) (MIT License) |
| **FD** | sharkdp | [github.com/sharkdp/fd](https://github.com/sharkdp/fd/releases/latest) (MIT License) |
| **FZF** | Junegunn Choi | [github.com/junegunn/fzf](https://github.com/junegunn/fzf/releases/latest) (MIT License) |
| **RipGrep (`rg`)** | BurntSushi | [github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep/releases/latest) (MIT License) |
| **Bat** | sharkdp | [github.com/sharkdp/bat](https://github.com/sharkdp/bat/releases/latest) (MIT License) |
| **Jq** | Tooljam | [jqlang.org](https://jqlang.org/download/) (MIT License) |
| **FFmpeg** | FFmpeg Team | [ffmpeg.org](https://ffmpeg.org/download.html) (GPL License) |
| **yt-dlp** | yt-dlp Team | [github.com/yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp/releases/latest) (Apache 2.0 License) |
| **Fastfetch** | Fastfetch Team | [github.com/fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch/releases/latest) (MIT License) |
| **Btop** | Aristocratos | [github.com/aristocratos/btop](https://github.com/aristocratos/btop/releases/latest) (MIT License) |
| **Gping** | ORF | [github.com/orf/gping](https://github.com/orf/gping/releases/latest) (MIT License) |
| **Zoxide** | Ajeet Dsouza | [github.com/ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide/releases/latest) (MIT License) |
| **Everything CLI** | Void Tools | [voidtools.com](https://www.voidtools.com/downloads/) |
| **Gemini CLI** | Google | [github.com/google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli/releases/latest) |
| **Rusty Rain** | Cowboy8625 | [github.com/cowboy8625/rusty-rain](https://github.com/cowboy8625/rusty-rain/releases/latest) |
| **Chess TUI** | Thomas Mauran | [github.com/thomas-mauran/chess-tui](https://github.com/thomas-mauran/chess-tui/releases/latest) |
| **Ramadan CLI** | PotatoMindPopper | [github.com/PotatoMindPopper/ramadan-cli](https://github.com/PotatoMindPopper/ramadan-cli) |
| **Cava** | Karlstav | [github.com/karlstav/cava](https://github.com/karlstav/cava) (GPL License) |
| **Atuin** | AtuinSh | [github.com/atuinsh/atuin](https://github.com/atuinsh/atuin/releases/latest) (MIT License) |

---

## Development & Coding

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **VS Code** | Microsoft Corporation | [code.visualstudio.com](https://code.visualstudio.com/Download) (MIT License) |
| **VSCodium** | VSCodium Community | [vscodium.com](https://vscodium.com/#install) (MIT License) |
| **Cursor** | Cursor Technologies | [cursor.com](https://www.cursor.com/downloads) |
| **DevToys** | DevToys Team | [devtoys.app](https://devtoys.app/) (MIT License) |
| **Docker Desktop** | Docker Inc. | [docker.com](https://www.docker.com/products/docker-desktop/) |
| **Wakatime** | Wakatime | [wakatime.com](https://wakatime.com/windows) (MIT License) |
| **AutoHotkey** | AutoHotkey Team | [autohotkey.com](https://www.autohotkey.com/download/) (LGPL License) |
| **TinyTask** | TinyTask Team | [thetinytask.com](https://thetinytask.com/) |
| **Ngrok** |inconshreveable | [ngrok.com](https://ngrok.com/download) |
| **MEGA** | MEGA Limited | [mega.io](https://mega.io/desktop) |
| **Notepad++** | Don Ho | [notepad-plus-plus.org](https://notepad-plus-plus.org/downloads/) (GPL License) |

---

## Competitive Programming & Learning

| Resource | Credit | Link |
|----------|--------|------|
| **Codeforces** | Codeforces Platform | [codeforces.com](https://codeforces.com/) |
| **LeetCode** | LeetCode Corporation | [leetcode.com](https://leetcode.com/) |
| **Neetcode** | NeetCode (FAANG Engineer) | [neetcode.io](https://neetcode.io/) |
| **Roadmap.sh** | Roadmap.sh Community | [roadmap.sh](https://roadmap.sh/) |
| **CS50P** | Harvard CS50 | [cs50.harvard.edu/python](https://cs50.harvard.edu/python/2022/) |
| **CS50** | Harvard CS50 | [cs50.harvard.edu/x](https://cs50.harvard.edu/x/) |
| **Fireship** | Fireship (YouTube) | [youtube.com/@Fireship](https://www.youtube.com/@Fireship) |
| **Traversy Media** | Brad Traversy | [youtube.com/@TraversyMedia](https://www.youtube.com/@TraversyMedia) |
| **Hugging Face** | Hugging Face Team | [huggingface.co](https://huggingface.co/) |
| **Kaggle** | Google/Kaggle | [kaggle.com](https://www.kaggle.com/) |
| **Class Central** | Class Central Team | [classcentral.com](https://www.classcentral.com/) |
| **Security Blue Team** | Security Blue Team | [securityblue.team](https://securityblue.team/) |
| **The Halal Investing Course** | Canyon Mimbs | [halalstocksecrets.com](https://halalstocksecrets.com/) |

---

## AI & Local LLM

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Ollama** | Ollama Team | [ollama.com](https://ollama.com/download) (Apache 2.0 License) |
| **Open WebUI** | open-webui Team | [github.com/open-webui/open-webui](https://github.com/open-webui/open-webui) (Apache 2.0 License) |
| **ComfyUI** | ComfyUI Team | [github.com/comfyanonymous/ComfyUI](https://github.com/comfyanonymous/ComfyUI/releases/latest) (MIT License) |
| **OmniVoice** | OmniVoice Team | [omnivoice.ai](https://omnivoice.ai/) |
| **Immich** | Immich Team | [immich.app](https://immich.app/docs/install/docker-compose) (MIT License) |

---

## Media & Creative

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **DaVinci Resolve** | Blackmagic Design | [blackmagicdesign.com](https://www.blackmagicdesign.com/products/davinciresolve) |
| **GIMP** | GIMP Foundation | [gimp.org](https://www.gimp.org/downloads/) (GPL License) |
| **Audacity** | Audacity Team | [audacityteam.org](https://www.audacityteam.org/download/) (LGPL License) |
| **OBS Studio** | OBS Project | [obsproject.com](https://obsproject.com/download) (GPL License) |
| **Sunshine** | LizardByte | [github.com/LizardByte/Sunshine](https://github.com/LizardByte/Sunshine/releases/latest) |
| **ScreenBox** | Microsoft Store | [apps.microsoft.com](https://apps.microsoft.com/detail/9ntsnmsvcb5g) |

---

## Networking & Remote Access

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Tailscale** | Tailscale Inc. | [tailscale.com](https://tailscale.com/download) |
| **ZeroTier** | ZeroTier Inc. | [zerotier.com](https://www.zerotier.com/download/) |
| **NextDNS** | NextDNS Team | [nextdns.io](https://nextdns.io/) |
| **Proton VPN** | Proton Technologies | [protonvpn.com](https://protonvpn.com/download) |
| **LocalSend** | LocalSend Team | [localsend.org](https://localsend.org/download) (MIT License) |
| **QuickShare** | Google | [android.com/better-together/quick-share-app](https://www.android.com/better-together/quick-share-app/) |
| **RustDesk** | RustDesk Team | [rustdesk.com](https://rustdesk.com/index.html#download) (MIT License) |
| **Playit** | PlayIt Team | [playit.gg](https://playit.gg/download) |
| **WireShark** | Wireshark Foundation | [wireshark.org](https://www.wireshark.org/download.html) (GPL License) |

---

## Security & Privacy

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Proton Mail** | Proton Technologies | [proton.me/mail](https://proton.me/mail/download) |
| **Signal** | Signal Foundation | [signal.org](https://signal.org/download/) |
| **Wire** | Wire Communications | [wire.com](https://wire.com/en/download/) |
| **Vencord** | Vencord Team | [vencord.dev](https://vencord.dev/download/) |

---

## Gaming & Game Management

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Steam** | Valve Corporation | [store.steampowered.com](https://store.steampowered.com/about/) |
| **Playnite** | Playnite Team | [playnite.link](https://playnite.link/download.html) (MIT License) |
| **Legacy Launcher** | Legacy Launcher Team | [llaun.ch](https://llaun.ch/en) |
| **Itch.io** | Itch.io Inc. | [itch.io](https://itch.io/app) |
| **Moonlight** | LunarG | [moonlight-stream.org](https://moonlight-stream.org/) |

---

## Productivity & Organization

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Obsidian** | Obsidian.md | [obsidian.md](https://obsidian.md/download) (Affero GPL License) |
| **Flow Launcher** | Flow Launcher Team | [flowlauncher.com](https://www.flowlauncher.com/) (MIT License) |
| **Ear Trumpet** | EarTrumpet Team | [eartrumpet.app](https://eartrumpet.app/) |
| **NileSoft Shell** | NileSoft | [nilesoft.org](https://nilesoft.org/download) |
| **Stirling PDF** | Stirling Tools Team | [github.com/Stirling-Tools/Stirling-PDF](https://github.com/Stirling-Tools/Stirling-PDF/releases/latest) (MIT License) |
| **Neat Download Manager** | Neat Download Manager Team | [neatdownloadmanager.com](https://www.neatdownloadmanager.com/index.php/en/) |

---

## Communication

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **WhatsApp** | Meta Platforms | [whatsapp.com](https://www.whatsapp.com/download) |
| **Signal** | Signal Foundation | [signal.org](https://signal.org/download/) |
| **Wire** | Wire Communications | [wire.com](https://wire.com/en/download/) |
| **Vencord** | Vencord Team | [vencord.dev](https://vencord.dev/download/) |

---

## Browsers & Web

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Vivaldi** | Vivaldi Technologies | [vivaldi.com](https://vivaldi.com/download/) |
| **Zen Browser** | Zen Browser Team | [zen-browser.app](https://zen-browser.app/download) |

---

## Self-Hosted & Infrastructure

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **Docker Desktop** | Docker Inc. | [docker.com](https://www.docker.com/products/docker-desktop/) |
| **VMware Workstation Pro** | Broadcom | [broadcom.com](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware+Workstation+Pro) |
| **Immich** | Immich Team | [immich.app](https://immich.app/docs/install/docker-compose) (MIT License) |
| **Open WebUI** | open-webui Team | [github.com/open-webui/open-webui](https://github.com/open-webui/open-webui) (Apache 2.0 License) |
| **Stirling PDF** | Stirling Tools Team | [github.com/Stirling-Tools/Stirling-PDF](https://github.com/Stirling-Tools/Stirling-PDF/releases/latest) (MIT License) |

---

## Download & Package Management

| Tool | Credit | License/Notes |
|------|--------|---------------|
| **UniGetUI** | Mart Climent | [github.com/marticliment/UniGetUI](https://github.com/marticliment/UniGetUI/releases/latest) |
| **QBittorrent** | qBittorrent Team | [qbittorrent.org](https://www.qbittorrent.org/download) (GPL License) |

---

## Special Thanks

### Core Contributors & Community

- **Microsoft Corporation** - For developing PowerToys, VS Code, PowerShell, and numerous Sysinternals tools that form the backbone of this collection.
- **Void Tools** (Lars Komsvoll) - Creator of Everything and Everything CLI, revolutionizing Windows file search.
- **sharkdp** - Developer of multiple excellent CLI tools including fd, bat, and rg alternatives.
- **Jesse Duffield** - Creator of Lazygit and LazyDocker, setting the standard for TUI tools.
- **LalithK90** - Developer of macOS Dock Windows, enabling macOS-style dock on Windows.
- **OpenRGB** - Open-source RGB lighting control, community-driven alternative to proprietary software.
- **ModernFlyouts** - ModernFlyouts-Community, modernizing Windows 11 UI components.
- **CodeSector** - Creator of TeraCopy and other file management utilities.
- **Guru3D** - Hosting display drivers and utilities like DDU and RTSS.
- **Blackmagic Design** - Providing free professional tools like DaVinci Resolve and DaVinci Resolve Studio.
- **Signal Foundation** - Maintaining Signal, the gold standard for encrypted messaging.
- **Proton Technologies** - Privacy-focused tools and services including Proton Mail and Proton VPN.
- **RustDesk** - Open-source TeamViewer alternative, self-hostable and encrypted.
- **LocalSend** - Decentralized, privacy-focused file sharing on local networks.
- **NeetCode** - FAANG engineer providing curated LeetCode learning resources.

### Security & Privacy Initiatives

We thank all open-source communities maintaining privacy-focused tools:
- Signal Foundation for end-to-end encrypted messaging
- Proton Technologies for privacy-first services
- Wire Communications for secure team collaboration
- RustDesk team for open-source remote access

### Educational Resources

Special acknowledgment to:
- **Harvard University** - CS50 and CS50P courses
- **Codeforces**, **LeetCode**, and **Kaggle** - Competitive programming platforms
- **Hugging Face** - AI model hosting and democratization
- **Class Central** - MOOC aggregation platform

### Open Source Licenses

Most tools in this collection are available under open-source licenses:
- **MIT License** - Permissive license allowing modification and commercial use
- **GPL License** - Copyleft license ensuring derivative works remain open-source
- **Apache 2.0 License** - Permissive with explicit patent grants
- **LGPL License** - Allows linking with proprietary software

### License Attribution

Please respect the licenses of each tool and check their respective repositories for:
- License text and conditions
- Contributor lists
- Attribution requirements
- Commercial use restrictions

### Community Recognition

We extend special appreciation to:
- All tool maintainers who actively respond to community feedback
- Users who report bugs and suggest improvements
- Contributors who document tutorials and create community guides
- Companies who provide free versions of professional tools (DaVinci Resolve, VMware for personal use)

---


## License

This repository is distributed under the **MIT License**. Individual tools have their own licenses — see each project's documentation for details.
