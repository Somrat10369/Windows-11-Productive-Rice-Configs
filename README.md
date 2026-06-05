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
  ollama launch claude 
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

| Action                   | Key                     |
| ------------------------ | ----------------------- |
| Focus left/right/up/down | `Alt + H/L/K/J`         |
| Move window              | `Alt + Shift + H/L/K/J` |
| Close window             | `Alt + Q`               |
| Toggle floating          | `Alt + T`               |

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

## License

This repository is distributed under the **MIT License**. Individual tools have their own licenses — see each project's documentation for details.

