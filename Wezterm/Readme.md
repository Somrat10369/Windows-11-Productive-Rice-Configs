# WezTerm

WezTerm is a powerful cross-platform terminal emulator and multiplexer written by [@wez](https://github.com/wez) and implemented in **Rust**.

## Installation

Download and install the `setup.exe` from the [Official Website](https://github.com/wez)

## Setup

* Drop/Replace `wezterm.lua` in `C:\Users\{Usernaem}\.config\wezterm\`
* (field) Wezterm.action in the config file is completly fine. But if you want to get rid of it:
  `git clone https://github.com/DrKJeff16/wezterm-types.git C:\Users\Somrat\.config\wezterm\wezterm-types`

> Without it → WezTerm works 100% normally. You just lose IDE autocompletion and inline type hints while editing the config.
> With it → Your editor (Neovim/VSCode) can suggest fields, show docs on hover, and flag typos in the config.


# PowerShell Profile

A Windows PowerShell profile focused on a fast, keyboard-driven terminal workflow. It brings together cached shell initializations, enhanced file navigation, Git shortcuts, system utilities, local AI query helpers, and a built-in command cheatsheet.

> **Note:** This profile is tailored to a specific Windows setup. Several commands depend on external tools, local paths, or services. Review the configuration section before using it on another machine.

## Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Command Reference](#command-reference)
- [Startup Behavior](#startup-behavior)
- [Troubleshooting](#troubleshooting)
- [Safety Notes](#safety-notes)

## Features

- **Cached startup:** caches initialization scripts for Oh My Posh, Zoxide, and Atuin under `~/.cache/powershell`.
- **Prompt and navigation:** Oh My Posh prompt, Zoxide-powered directory jumping, and a `Tab` menu-completion keybinding.
- **Modern file tools:** Eza listings, Bat-powered file output, FZF integration, and the Yazi terminal file manager.
- **Editor picker:** opens files with Microsoft Edit, Visual Studio Code, or Neovim, depending on what is installed.
- **File helpers:** create/touch files, copy file contents to the clipboard, append text, and copy the current directory path.
- **Git shortcuts:** compact aliases for common status, staging, commit, push, log, checkout, and diff tasks.
- **System tools:** system summary, process picker/terminator, TCP-port inspection, and weather lookup.
- **AI helpers:** short natural-language query commands that forward prompts to an `ask` function.
- **Coreutils integration:** optional command-line rewriting for selected commands when GNU Coreutils is installed in the configured path.
- **Completions:** ComfyUI native argument completion and WinGet command-not-found integration.
- **Extras:** Matrix-style terminal animation, Termux text-to-speech over SSH, and a built-in cheatsheet.

## Requirements

The profile assumes **Windows with PowerShell 7 (`pwsh`)**. Install only the tools you plan to use.

### Main dependencies

| Tool / module                                   | Used for                                                                   |
| ----------------------------------------------- | -------------------------------------------------------------------------- |
| [Oh My Posh](https://ohmyposh.dev/)             | Prompt                                                                     |
| [Zoxide](https://github.com/ajeetdsouza/zoxide) | Smart directory jumping                                                    |
| `PSReadLine`                                    | Interactive line editing and completion                                    |
| [Atuin](https://atuin.sh/)                      | Shell history integration                                                  |
| [Eza](https://github.com/eza-community/eza)     | File listings                                                              |
| [Bat](https://github.com/sharkdp/bat)           | Syntax-highlighted file output; falls back to `Get-Content` if unavailable |
| [FZF](https://github.com/junegunn/fzf)          | Interactive fuzzy selection                                                |
| [Fd](https://github.com/sharkdp/fd)             | File and directory search for FZF                                          |
| [Yazi](https://yazi-rs.github.io/)              | Terminal file manager                                                      |
| Git                                             | Git shortcuts                                                              |
| `curl.exe`                                      | Weather request                                                            |
| `ssh`                                           | Termux TTS helpers                                                         |
| `Microsoft.WinGet.CommandNotFound`              | WinGet command-not-found integration                                       |

### Optional or setup-specific dependencies

- **Microsoft Edit** (`edit.exe`), **VS Code** (`code`), and/or **Neovim** (`nvim`) for the `edit` command.
- **ComfyUI CLI** (`comfy`) for its argument completer.
- **GNU Coreutils for Windows** in `C:\Program Files\coreutils\cmd\` for the profile's command-rewriting optimizer.
- A local AI service exposing the `ask` command/function, with its endpoint configured as needed.
- A reachable Termux device with `termux-tts-speak` available over SSH for `ttsb` and `ttse`.

Some commands will be unavailable or fail until their dependencies are installed and configured.

## Installation

1. Open PowerShell and locate the profile file:

   ```powershell
   $PROFILE
   ```

2. Back up any existing profile:

   ```powershell
   if (Test-Path $PROFILE) {
       Copy-Item $PROFILE "$PROFILE.backup" -Force
   }
   ```

3. Create the profile directory if needed:

   ```powershell
   New-Item -ItemType Directory -Path (Split-Path $PROFILE) -Force
   ```

4. Copy this script to the path printed by `$PROFILE`. If you already have a profile, merge the contents instead of blindly replacing it.

5. Review the paths and placeholders in [Configuration](#configuration).

6. Reload the profile:

   ```powershell
   . $PROFILE
   ```

   Or run `reload` after the profile has loaded. That function reloads the profile, clears the screen, and runs `fastfetch`.

## Configuration

The script contains several machine-specific settings. Adjust them for your environment before use.

### Prompt configuration

The Oh My Posh configuration is expected at:

```text
~/.config/oh-my-posh/pywal.omp.json
```

Its generated initialization cache is stored at:

```text
~/.cache/powershell/oh-my-posh.ps1
```

The profile regenerates the cache when it is missing or when the prompt configuration file is newer. `Reload-Omp` forces a refresh.

### Local paths and environment variables

Review these settings near the top of the script:

- `YAZI_FILE_ONE` — path to Git's `file.exe`.
- `CLAUDE_PLUGIN_ROOT` — Claude plugin directory; replace the `{usrname}` placeholder with your Windows user directory.
- `ANTHROPIC_BASE_URL` — currently points to `http://localhost:8001`.
- `FZF_DEFAULT_COMMAND`, `FZF_CTRL_T_COMMAND`, and `FZF_ALT_C_COMMAND` — configure Fd-based file and directory searches.
- `_ZO_FZF_OPTS` — configures Zoxide's FZF preview using Eza.

The `ask` command used by `why`, `how`, `what`, `who`, `when`, and `??` is **not defined in this profile**. Ensure another script, module, or local AI integration provides it.

### Termux text-to-speech

`ttsb` and `ttse` use SSH to connect to a configured host on port `8022`, then run `termux-tts-speak` in Bangla or English. Replace the example username and host with your own values, and make sure SSH authentication and Termux access work first.

### GNU Coreutils optimizer

The optimizer is tied to this path:

```text
C:\Program Files\coreutils\cmd\
```

If Coreutils is absent there, the rewriting hook skips its transformations. The script also intentionally preserves the profile's `ls`, `la`, and `cat` function overrides.

## Command Reference

### Navigation and files

| Command              | Description                                                                      |
| -------------------- | -------------------------------------------------------------------------------- |
| `cd [path]`          | Jump using Zoxide; with no path, go to `$HOME`.                                  |
| `up [n]`             | Move up `n` parent directories; defaults to one.                                 |
| `ls [args]`          | Eza listing with icons and directories first.                                    |
| `ll [args]`          | Detailed Eza listing with Git status.                                            |
| `la [args]`          | Eza listing including hidden files.                                              |
| `lla [args]`         | Detailed listing including hidden files and Git status.                          |
| `lt [args]`          | Eza tree view, two levels deep by default.                                       |
| `cat [path]`         | Use `bat` when installed; otherwise use `Get-Content`.                           |
| `y [args]`           | Open Yazi; selected files are sent to the editor picker or the specified editor. |
| `edit [path ...]`    | Choose an installed editor: Microsoft Edit, VS Code, or Neovim.                  |
| `touch path...`      | Create missing files or update existing files' modification times.               |
| `yc path`            | Copy a file's contents to the clipboard.                                         |
| `ac filename [text]` | Append supplied text or enter lines interactively until a blank line.            |
| `ccd`                | Copy the current directory path to the clipboard.                                |

### Git shortcuts

| Command      | Equivalent / purpose                            |
| ------------ | ----------------------------------------------- |
| `gs`         | `git status`                                    |
| `ga [args]`  | `git add`                                       |
| `gc message` | `git commit -m`                                 |
| `gp [args]`  | `git push`                                      |
| `gl [args]`  | Compact graph log with decorations and all refs |
| `gco [args]` | `git checkout`                                  |
| `gd [args]`  | `git diff`                                      |

Example:

```powershell
gs
ga .
gc "Update configuration"
gp
```

### System utilities

| Command         | Description                                                                                           |
| --------------- | ----------------------------------------------------------------------------------------------------- |
| `sysinfo`       | Display CPU, GPU, RAM use, filesystem space, uptime, Windows build, and hostname.                     |
| `proc [name]`   | FZF-select processes sorted by CPU use; press `Tab` to select multiple and `Enter` to terminate them. |
| `port number`   | Show TCP connections on a local port and the owning process when available.                           |
| `weather`       | Fetch weather from `wttr.in/narshingdi`. Edit the function to change the location.                    |
| `which command` | Show the source path for a command PowerShell can resolve.                                            |
| `reload`        | Reload the profile, clear the terminal, and run `fastfetch`.                                          |
| `Reload-Omp`    | Regenerate and reload the Oh My Posh initialization cache.                                            |

**Caution:** `proc` force-stops selected processes. Check the process name and PID before confirming a selection.

### AI query helpers

These functions forward a question to an external `ask` command/function:

```powershell
why "does this error occur"
how "configure a Python virtual environment"
what "is a PowerShell profile"
who "maintains this package"
when "does this scheduled task run"
?? "explain this command"
```

The `ask` implementation and the actual model/service are configured outside this script.

### Extras

| Command       | Description                                                    |
| ------------- | -------------------------------------------------------------- |
| `matrix`      | Run a Matrix-like character animation. Press `Ctrl+C` to stop. |
| `ttsb "text"` | Send text to the configured Termux device for Bangla speech.   |
| `ttse "text"` | Send text to the configured Termux device for English speech.  |
| `inh` / `ing` | Print the built-in command cheatsheet.                         |

## Startup Behavior

When PowerShell loads this profile, it:

1. Starts a stopwatch to measure profile initialization time.
2. Sets UTF-8 console encoding.
3. Creates `~/.cache/powershell` if it does not exist.
4. Loads cached Oh My Posh and Zoxide initialization scripts, generating them when missing; refreshes the Oh My Posh cache if its configuration is newer.
5. Imports PSReadLine, sets `Tab` to menu completion, then loads Atuin.
6. Sets environment variables and defines aliases, helpers, and utility functions.
7. Registers the ComfyUI argument completer and imports the WinGet command-not-found module.
8. Installs a `PSConsoleHostReadLine` hook that lets Atuin capture command input before optionally rewriting selected commands for GNU Coreutils.
9. Prints the profile load time, using a color based on elapsed time.

The Coreutils hook only rewrites commands when the configured Coreutils directory exists. Its purpose is to route selected commands to the Windows Coreutils executables while preserving selected PowerShell function overrides.

## Troubleshooting

- **A command is not recognized:** install its dependency and confirm it is available on `PATH`. Check with `Get-Command <name>`.
- **Oh My Posh fails to initialize:** verify the config file exists at `~/.config/oh-my-posh/pywal.omp.json`, then run `Reload-Omp`.
- **Zoxide or Atuin does not load:** check that the executable is installed and that its initialization command succeeds in a fresh terminal.
- **`y` cannot open a selected file:** verify Yazi's chooser output and ensure the selected editor is installed. The VS Code branch uses a specific executable path; adjust it if VS Code is installed elsewhere.
- **AI helpers fail:** confirm that `ask` is defined and that the local AI service is running at the expected endpoint.
- **Termux TTS fails:** verify the SSH target, port, credentials, and availability of `termux-tts-speak` on the remote device.
- **Coreutils rewriting does not occur:** verify that `C:\Program Files\coreutils\cmd\` exists and contains the expected `.cmd` executables.
- **A profile change does not take effect:** open a new PowerShell session or run `. $PROFILE`.

## Safety Notes

- Review every hard-coded path, username, host, and local endpoint before publishing this profile.
- Do not commit private IP addresses, usernames, machine-specific paths, API keys, or other sensitive configuration to a public repository.
- `proc` can terminate processes forcibly. Avoid selecting system-critical processes.
- `gc` commits immediately with the message supplied; review staged changes before running it.
- The profile is designed for a customized environment and may need edits before it works elsewhere.

## License

No license is specified here. Add a `LICENSE` file if you intend to distribute this profile and want to define reuse terms.
