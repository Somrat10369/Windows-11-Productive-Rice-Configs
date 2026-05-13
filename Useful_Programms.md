# Software & Tools Master List

> A comprehensive reference of applications, utilities, CLI tools, and learning platforms.
> Organized by category. Last updated: May 2026.

---

## Table of Contents

1. [Benchmarking & Hardware Info](#benchmarking--hardware-info)
2. [System Utilities & Tweaks](#system-utilities--tweaks)
3. [File Management](#file-management)
4. [Terminal & Shell](#terminal--shell)
5. [CLI Tools](#cli-tools)
6. [Development & Coding](#development--coding)
7. [AI & Local LLM](#ai--local-llm)
8. [Media & Creative](#media--creative)
9. [Networking & Remote Access](#networking--remote-access)
10. [Security & Privacy](#security--privacy)
11. [Gaming & Game Management](#gaming--game-management)
12. [Productivity & Organization](#productivity--organization)
13. [Communication](#communication)
14. [Learning Platforms](#learning-platforms)
15. [Browsers & Web](#browsers--web)
16. [Self-Hosted & Infrastructure](#self-hosted--infrastructure)

---

## Benchmarking & Hardware Info

| Tool                            | Description                                                                                                  |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **3DMark Demo**                 | Industry-standard GPU/gaming benchmark suite by Futuremark. Tests DirectX, ray tracing, and more.            |
| **Heaven Benchmark**            | Unigine's GPU stress test focused on tessellation and DirectX 11 rendering.                                  |
| **CrystalDiskMark**             | Disk read/write speed benchmark. Measures sequential and random I/O performance.                             |
| **CrystalDiskInfo**             | Disk health monitor. Reads S.M.A.R.T. data and alerts on drive issues.                                       |
| **CPU-Z**                       | Lightweight CPU diagnostics — shows clock speed, cache, voltage, and memory specs in real time.              |
| **HWiNFO**                      | Deep hardware monitoring: sensors for GPU, CPU, drives, VRM, power draw. Integrates with YASB, RTSS, etc.    |
| **MSI Afterburner + RivaTuner** | GPU overclocking, undervolting, fan curve control (Afterburner), plus in-game FPS/stats overlay (RivaTuner). |
| **Samsung Magician**            | Samsung SSD management — firmware updates, RAPID Mode, health check, benchmark.                              |

---

## System Utilities & Tweaks

| Tool                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| **Display Driver Uninstaller (DDU)** | Completely removes GPU/audio drivers before clean reinstalls. Prevents driver conflicts.                        |
| **Revo Uninstaller**                 | Uninstaller with deep scan — removes leftover registry entries and files after standard uninstall.              |
| **HiBit Startup Manager**            | Startup manager covering boot entries, scheduled tasks, services, and context menu items with security ratings. |
| **QuickStartup (Glarysoft)**         | Lightweight startup manager to disable or delay auto-start programs and improve boot times.                     |
| **WinAero Tweaker**                  | Advanced Windows settings tweaker for UI, context menus, Explorer behavior, and hidden registry options.        |
| **Windhawk**                         | Mod platform for customizing Windows — mods are installed like extensions, covering taskbar, Explorer, etc.     |
| **UltraUxThemePatcher**              | Patches Windows to allow unsigned third-party visual themes (required for custom msstyles).                     |
| **PowerToys**                        | Microsoft's official power-user toolkit: FancyZones, PowerRename, Run launcher, image resizer, and more.        |
| **GlazeWM**                          | Tiling window manager for Windows inspired by i3. Manages windows in a tree-based layout via config file.       |
| **YASB Reborn**                      | Yet Another Status Bar — customizable Windows status bar showing system stats, time, widgets.                   |
| **Tacky Borders**                    | Adds colored borders to focused/unfocused windows on Windows, similar to Hyprland's border feature.             |
| **Rainmeter**                        | Desktop customization platform — displays widgets, system stats, visualizers, and skins on the desktop.         |
| **Mac OS Dock**                      | Third-party macOS-style dock for Windows. Adds an animated application launcher dock to the desktop.            |
| **Fluent Flyout**                    | Replaces the default Windows volume/brightness OSD with a modern Fluent Design popup.                           |
| **Fluent Weather**                   | Minimalist Fluent Design weather app for Windows with clean animations and live weather data.                   |
| **Process Explorer**                 | Sysinternals tool replacing Task Manager with a detailed tree view of processes, handles, and DLLs.             |
| **Everything (voidtools)**           | Instant file search across the entire filesystem using NTFS indexing. Near-zero delay.                          |
| **Everything Toolbar**               | Integrates Everything search directly into the Windows taskbar as a search box.                                 |
| **Open RGB**                         | Cross-platform RGB lighting control for motherboards, GPUs, RAM, peripherals — brand-agnostic.                  |

---

## File Management

| Tool                    | Description                                                                                                                                                    |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **FilePilot**           | High-performance file manager written in C. Under 2MB, near-instant launch, multi-pane, tabbed, fuzzy search, built-in file inspector. Currently free in beta. |
| **Dropshelf**           | Drag-and-drop shelf utility for Windows. Shake mouse to open a floating shelf; stash files while navigating between folders.                                   |
| **Bulk Rename Utility** | Powerful batch file renaming with filters, regex, numbering, date stamps, and case options.                                                                    |
| **WizTree**             | Fastest disk space analyzer for Windows — uses MFT directly for near-instant results even on large drives.                                                     |
| **TeraCopy**            | Faster, more reliable file copy/move with checksum verification, pause/resume, and error recovery.                                                             |
| **NanaZip**             | Modern fork of 7-Zip with Windows 11 context menu integration and Fluent UI design.                                                                            |
| **WinRAR**              | Long-standing archive manager supporting RAR, ZIP, and many other formats with strong compression.                                                             |
| **UltraISO**            | ISO/disc image editor and virtual drive mounter. Create, edit, burn, and mount disc images.                                                                    |

---

## Terminal & Shell

| Tool                    | Description                                                                                                                                                                                               |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **PowerShell 7 (pwsh)** | Cross-platform, open-source shell by Microsoft. Successor to Windows PowerShell 5.1 with better scripting and module support.                                                                             |
| **MSYS2**               | Unix-like environment for Windows — provides pacman package manager, bash, and GCC toolchain. Essential for compiling Linux-native software on Windows.                                                   |
| **Ms_edit**             | Microsoft's minimal, blazing-fast terminal text editor for Windows. Lightweight successor concept to the old DOS `edit` command, rebuilt for modern use.                                                  |
| **NeoVim**              | Hyperextensible Vim-based text editor. Community-driven fork of Vim with Lua config, LSP, and plugin ecosystem.                                                                                           |
| **Neovide**             | GPU-accelerated graphical frontend for NeoVim with smooth cursor animations and font rendering.                                                                                                           |
| **Vim Hero**            | Interactive intro course to Vim keybindings and modal editing — teaches normal, insert, visual, and command modes.                                                                                        |
| **Terax**               | Lightweight (~7MB) AI-native terminal emulator built with Rust + Tauri 2 + React 19. Multi-tab PTY, integrated code editor, file explorer, and AI side-panel (BYOK or local via LM Studio). No telemetry. |
| **Zellij**              | Terminal multiplexer (alternative to tmux) with built-in layouts, plugins, and a friendlier default UX.                                                                                                   |

---

## CLI Tools

| Tool                  | Description                                                                                              |
| --------------------- | -------------------------------------------------------------------------------------------------------- |
| **Git**               | Distributed version control system. The standard for tracking code changes and collaborating.            |
| **GitHub CLI (`gh`)** | Official GitHub CLI — manage PRs, issues, repos, gists, and workflows from the terminal.                 |
| **Lazygit**           | Terminal UI for Git — interactive staging, branching, rebasing, and diffs in a clean TUI.                |
| **LazyDocker**        | Terminal UI for Docker — monitor containers, images, volumes, and logs without typing commands.          |
| **Yazi**              | Blazing-fast terminal file manager written in Rust with async I/O, image previews, and plugin support.   |
| **Eza**               | Modern `ls` replacement written in Rust — colors, icons, Git status, tree view.                          |
| **Fd**                | Fast and user-friendly alternative to `find`. Ignores `.gitignore` by default, supports regex.           |
| **FZF**               | General-purpose fuzzy finder for the terminal. Integrates with bash/zsh history, file search, kill, etc. |
| **RipGrep (`rg`)**    | Extremely fast regex search tool. Respects `.gitignore`, searches recursively by default.                |
| **Bat**               | `cat` with syntax highlighting, line numbers, Git integration, and paging support.                       |
| **Jq**                | Lightweight command-line JSON processor — slice, filter, map, and transform JSON streams.                |
| **FFmpeg**            | Powerful multimedia framework for converting, streaming, recording, and processing audio/video.          |
| **yt-dlp**            | Feature-rich fork of youtube-dl — downloads video/audio from YouTube and 1000+ other sites.              |
| **Fastfetch**         | System information fetcher (neofetch replacement) — fast, configurable, shows specs with ASCII/logo art. |
| **Btop**              | Resource monitor TUI — shows CPU, memory, disk, network, and processes in a beautiful interface.         |
| **Gping**             | Visual `ping` — shows real-time latency graph in the terminal for one or multiple hosts simultaneously.  |
| **Zoxide**            | Smarter `cd` — learns your most-used directories and jumps to them with minimal typing (`z proj`).       |
| **Everything CLI**    | Command-line interface for the Everything search engine by voidtools.                                    |
| **Gemini CLI**        | Google's official terminal client for interacting with Gemini AI models from the command line.           |
| **Ask CLI**           | AWS CLI tool for building and managing Alexa Skills from the terminal.                                   |
| **Browser CLI**       | Terminal-based web browser (e.g., Lynx/w3m style) for browsing the web without a GUI.                    |
| **Rusty Rain**        | Matrix-style terminal rain animation written in Rust (`cmatrix` alternative).                            |
| **Chess TUI**         | Play chess directly in the terminal with a rendered board and engine support.                            |
| **Ramadan CLI**       | Terminal tool for displaying Islamic prayer times, Suhoor/Iftar countdowns, and Hijri calendar info.     |
| **Cava**              | Console-based audio visualizer that reacts to system audio in real time in the terminal.                 |

---

## Development & Coding

| Tool                  | Description                                                                                                           |
| --------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **VS Code**           | Microsoft's popular open-source code editor with extensions for nearly every language and workflow.                   |
| **Open Code**         | Open-source alternative/fork of VS Code with community-driven features and no telemetry.                              |
| **DevToys (Preview)** | Developer Swiss Army knife — JSON formatter, base64 encoder/decoder, hash generator, regex tester, and more. Offline. |
| **Docker**            | Container platform for packaging and running applications in isolated environments.                                   |
| **Wakatime**          | Time-tracking plugin for editors — logs coding time per project, language, and file automatically.                    |
| **AutoHotkey**        | Windows scripting language for keyboard macros, automation, remapping, and GUI creation.                              |
| **TinyTask**          | Minimal macro recorder — records and replays mouse/keyboard actions. No installation needed.                          |
| **Ngrok**             | Secure tunnel to expose local servers to the internet instantly. Used for webhooks, demos, and testing.               |
| **MEGA**              | Cloud storage client with end-to-end encryption. 20GB free tier. Desktop sync available.                              |

---

## Competitive Programming & Learning

| Tool                           | Description                                                                                                                      |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| **Codeforces**                 | Competitive programming platform with rated contests, problem archive, and editorial system.                                     |
| **LeetCode**                   | Coding interview prep platform — algorithms, data structures, system design problems with company tags.                          |
| **Neetcode**                   | Curated LeetCode roadmap and video solutions by a FAANG engineer. Focus on patterns over brute-force memorization.               |
| **NeoDP**                      | NeoDP (Neo Dynamic Programming) — resource/tool for structured DP problem-solving practice.                                      |
| **Roadmap.sh**                 | Community-driven developer roadmaps for frontend, backend, DevOps, AI, and more. Visual learning paths.                          |
| **Roadmap.io**                 | Visual roadmap planning tool — build and track personal or team learning/project roadmaps.                                       |
| **CS50P**                      | Harvard's free Python programming course via edX. Covers functions, OOP, libraries, and final project.                           |
| **CS50**                       | Harvard's flagship intro to computer science — C, Python, SQL, web dev. One of the best free CS courses.                         |
| **Fireship**                   | YouTube channel and platform for fast-paced programming tutorials. "100 seconds" format. Covers modern web, tools, and concepts. |
| **Class Central**              | Course aggregator — search and compare free/paid MOOCs from Coursera, edX, MIT, and hundreds more.                               |
| **Cliff's Notes**              | Study guide platform — summaries for literature, history, math, and science subjects.                                            |
| **Security Blue Team**         | E-learning platform focused on blue team cybersecurity — SOC, threat hunting, DFIR, and defensive skills.                        |
| **The Halal Investing Course** | Islamic finance and halal investing course by Canyon Mimbs — covers Sharia-compliant investing principles.                       |

---

## AI & Local LLM

| Tool           | Description                                                                                                   |
| -------------- | ------------------------------------------------------------------------------------------------------------- |
| **Ollama**     | Run large language models locally — simple CLI to pull and run models (Qwen, Llama, Mistral, etc.).           |
| **Open WebUI** | Browser-based chat interface for Ollama and OpenAI-compatible backends. Supports RAG, tools, and multi-model. |
| **ComfyUI**    | Node-based Stable Diffusion GUI for advanced image generation workflows. Highly extensible via custom nodes.  |
| **OmniVoice**  | Voice cloning and TTS platform supporting multiple languages including Bangla and English.                    |
| **Voice Box**  | AI voice generation tool — create realistic voiceovers or clone voices for content and automation.            |
| **Immich**     | Self-hosted Google Photos alternative with ML face recognition, album management, and mobile sync.            |

---

## Media & Creative

| Tool                | Description                                                                                                           |
| ------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **DaVinci Resolve** | Professional non-linear video editor by Blackmagic. Free version includes advanced color grading and Fusion VFX.      |
| **GIMP**            | Open-source raster image editor — full-featured alternative to Photoshop for photo editing and design.                |
| **Audacity**        | Free, open-source audio editor — record, edit, mix, and apply effects to audio files.                                 |
| **OBS Studio**      | Free, open-source streaming and screen recording software. Industry standard for live production.                     |
| **Sunshine**        | Self-hosted game streaming server (pairs with Moonlight client). Stream your PC games to any device on LAN or remote. |
| **ScreenBox**       | Modern UWP media player for Windows — clean UI, supports most formats, replaces Windows Media Player.                 |

---

## Networking & Remote Access

| Tool                            | Description                                                                                                                          |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| **Tailscale**                   | Zero-config VPN built on WireGuard — creates a private mesh network between your devices.                                            |
| **ZeroTier**                    | Software-defined networking tool — creates virtual LANs over the internet for remote access and game hosting.                        |
| **NextDNS**                     | Cloud-based DNS resolver with ad/tracker blocking, custom allow/blocklists, and analytics.                                           |
| **Proton VPN**                  | Privacy-focused VPN by the Proton team. No-logs policy, open-source clients, free tier available.                                    |
| **Wireguard** _(via Tailscale)_ | Fast, modern VPN protocol underlying Tailscale's mesh network.                                                                       |
| **LocalSend**                   | Open-source AirDrop alternative — send files between devices on the same network without internet.                                   |
| **QuickShare**                  | Google's file sharing tool (formerly Nearby Share) — wireless transfers between Android and Windows.                                 |
| **RustDesk**                    | Open-source remote desktop application — self-hostable TeamViewer alternative with end-to-end encryption.                            |
| **Remote In Tech**              | Remote access and support tool aimed at tech professionals for managing remote sessions.                                             |
| **Ngrok**                       | _(see Development)_ Tunnel local ports to public URLs for webhooks and testing.                                                      |
| **Playit**                      | Free, permanent tunnel service by Developed Methods LLC — expose game servers or local services without port forwarding.             |
| **WireShark**                   | Network protocol analyzer — capture and inspect live network traffic at packet level. Essential for debugging and security analysis. |

---

## Security & Privacy

| Tool            | Description                                                                                                 |
| --------------- | ----------------------------------------------------------------------------------------------------------- |
| **Proton Mail** | End-to-end encrypted email service by Proton. Zero-access encryption, based in Switzerland.                 |
| **Signal**      | End-to-end encrypted messaging app. Open-source, minimal metadata, cross-platform.                          |
| **Vencord**     | Feature-rich client mod for Discord — adds themes, plugins, and privacy improvements to the Discord client. |

---

## Gaming & Game Management

| Tool                | Description                                                                                                          |
| ------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Steam**           | Valve's digital game distribution platform — library management, cloud saves, Workshop, and community features.      |
| **Playnite**        | Open-source game library manager — aggregates games from Steam, Epic, GOG, itch.io, and more into a single launcher. |
| **Legacy Launcher** | Popular third-party Minecraft launcher with offline mode, multi-account support, and mod/version management.         |
| **Itch.io**         | Indie game marketplace and launcher — thousands of free and paid games from indie developers.                        |
| **Sunshine**        | _(see Media)_ Self-hosted game streaming server.                                                                     |

---

## Productivity & Organization

| Tool               | Description                                                                                                                                                                |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Obsidian**       | Local-first, Markdown-based knowledge management. Bidirectional links, graph view, plugin ecosystem.                                                                       |
| **Notepad++**      | Lightweight, extensible code/text editor for Windows. Fast, tabbed, multi-language syntax highlighting.                                                                    |
| **Flow Launcher**  | Open-source app launcher for Windows — plugins for everything search, calculator, web search, shell commands.                                                              |
| **ClipClip**       | Clipboard manager for Windows — stores unlimited clipboard history, supports templates and folders.                                                                        |
| **Ear Trumpet**    | Per-app audio volume mixer for Windows with a modern UI. Replaces the buried Windows Sound Mixer.                                                                          |
| **Nilesoft Shell** | Powerful context menu extender for Windows File Explorer. Add/remove/reorder entries, supports SVG icons, nested menus, and scripted commands — configured via plain text. |
| **Windhawk**       | _(see System Utilities)_ Windows mod/plugin platform.                                                                                                                      |
| **Product Hunt**   | Platform for discovering new apps, tools, and products — daily ranked launches voted by the community.                                                                     |
| **Stirling PDF**   | Self-hosted web app for PDF operations — split, merge, compress, convert, annotate, OCR, and more. Offline-capable.                                                        |

---

## Communication

| Tool         | Description                                                                                     |
| ------------ | ----------------------------------------------------------------------------------------------- |
| **WhatsApp** | Meta's messaging app — end-to-end encrypted chats, voice/video calls, desktop client available. |
| **Signal**   | _(see Security)_ Encrypted messaging with minimal metadata.                                     |
| **Wire**     | Encrypted messaging and collaboration app focused on privacy. Supports teams and personal use.  |
| **Vencord**  | _(see Security)_ Discord client mod with enhanced features and privacy options.                 |
| **Facebook** | Meta's social media platform — groups, marketplace, events, and news feed.                      |

---

## Browsers & Web

| Tool        | Description                                                                                                            |
| ----------- | ---------------------------------------------------------------------------------------------------------------------- |
| **Vivaldi** | Chromium-based browser built for power users — tab stacking, tiling, built-in mail, calendar, and heavy customization. |
| **Zen**     | Firefox-based browser focused on privacy and minimalist design. Clean UI, strong defaults.                             |

---

## Self-Hosted & Infrastructure

| Tool                       | Description                                                                                                  |
| -------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Docker**                 | _(see Development)_ Container runtime for running self-hosted services in isolated environments.             |
| **VMware Workstation Pro** | Virtualization platform for running multiple OSes as VMs on a Windows/Linux host. Now free for personal use. |
| **Immich**                 | _(see AI)_ Self-hosted photo/video backup with mobile app.                                                   |
| **Open WebUI**             | _(see AI)_ Local LLM chat frontend.                                                                          |
| **Stirling PDF**           | _(see Productivity)_ Self-hostable PDF tool suite.                                                           |
| **Neat Download Manager**  | Free download manager with multi-threading, browser integration, and scheduler.                              |

---

## Download & Package Management

| Tool            | Description                                                                                                              |
| --------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **UniGetUI**    | GUI frontend for Windows package managers — winget, Scoop, Chocolatey, pip, npm, and cargo in one interface.             |
| **QBittorrent** | Free, open-source BitTorrent client. No ads, no bundled software. Supports sequential download, RSS, and search plugins. |
