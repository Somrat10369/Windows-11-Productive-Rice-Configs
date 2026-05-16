
# PowerShell Profile — Command Cheatsheet

## Navigation

| Command  | Description                        |
| -------- | ---------------------------------- |
| `cd`     | Fuzzy cd (zoxide) to any directory |
| `up [n]` | Go up N directories                |
| `fcd`    | Fuzzy select subdirectory          |
| `back`   | Return to previous directory       |
| `-`      | Alias for `back` (`cd -`)          |
| `dirs`   | Show directory stack               |

---

## File Manager

| Command | Description                 |
| ------- | --------------------------- |
| `y`     | Open Yazi file manager      |
| `edit`  | Edit files (Microsoft Edit) |

---

## File Operations

| Command | Description                     |
| ------- | ------------------------------- |
| `touch` | Create file / update timestamp  |
| `mkcd`  | Create dir and cd into it       |
| `yc`    | Copy file contents to clipboard |
| `ac`    | Append to file (interactive)    |
| `acc`   | Write to file (overwrite)       |

---

## Listing (EZA)

| Command | Description                     |
| ------- | ------------------------------- |
| `ls`    | List with icons                 |
| `ll`    | Long list with git              |
| `la`    | List all (including hidden)     |
| `lla`   | Long list all with git          |
| `lt`    | Tree view (level 2)             |
| `cat`   | Cat with bat (syntax highlight) |

---

## AI Query Helpers

| Command | Description              |
| ------- | ------------------------ |
| `why`   | Ask “why ...” questions  |
| `how`   | Ask “how ...” questions  |
| `what`  | Ask “what ...” questions |
| `who`   | Ask “who ...” questions  |
| `when`  | Ask “when ...” questions |
| `??`    | Generic ask command      |

---

## Git Shortcuts

| Command | Description                 |
| ------- | --------------------------- |
| `gs`    | `git status`                |
| `ga`    | `git add`                   |
| `gc`    | `git commit -m`             |
| `gp`    | `git push`                  |
| `gl`    | `git log --oneline --graph` |
| `gco`   | `git checkout`              |
| `gd`    | `git diff`                  |

---

## System Utilities

| Command   | Description                   |
| --------- | ----------------------------- |
| `sysinfo` | System snapshot with icons    |
| `proc`    | Fuzzy process viewer / killer |
| `port`    | Find process by port          |
| `timer`   | Countdown with progress bar   |
| `weather` | Weather from `wttr.in`        |
| `reload`  | Reload profile                |

---

## Easter Eggs

| Command   | Description                 |
| --------- | --------------------------- |
| `matrix`  | Matrix rain effect          |
| `hack`    | Fake hacker screen (scary!) |
| `hack -i` | Interactive hack mode       |
| `MrBeast` | ...never gonna let you down |

---

## Dev Tools

| Command   | Description                        |
| --------- | ---------------------------------- |
| `btop`    | Real-time system monitor           |
| `chess`   | TUI chess player                   |
| `console` | Fun ASCII animations               |
|           | `topic: game`                      |
|           | `stars-watcher`, `traction`        |
|           | `topic: print`                     |
|           | `hacker-types`, `draw-x/triangles` |
| `roza`    | Ramadan CLI                        |
| `rust`    | Rusty rain animation               |
| `surge`   | Surge CLI downloader               |

---

## Editors & Search

| Command  | Description                |
| -------- | -------------------------- |
| `nvim`   | Neovim                     |
| `typing` | Typing game CLI            |
| `es`     | Everything search          |
| `rg`     | Ripgrep                    |
| `lg`     | Lazygit                    |
| `fzf`    | Fuzzy finder               |
| `edit`   | Edit with preferred editor |
| `fd`     | Find files                 |
| `tldr`   | TLDR                       |
| `man`    | Man pages                  |

---

## AI & Cloud

| Command  | Description                             |
| -------- | --------------------------------------- |
| `ollama` | Ollama                                  |
| `gemini` | Gemini CLI                              |
| `claude` | Claude API                              |
| `ytdlp`  | YouTube-DL-Plus                         |
| `ngrok`  | ngrok                                   |
| `docker` | LazyDocker                              |
| `ssh`    | SSH                                     |
| `open`   | Open WebUI                              |
|          | `docker run -d -p 3000:8080 open-webui` |

---

## Media & Infra

| Command        | Description                                |
| -------------- | ------------------------------------------ |
| `voice`        | OmniVoice Demo                             |
|                | `--ip 0.0.0.0 --port 8001 --device cuda:0` |
| `nextdns`      | NextDNS                                    |
| `comfyui`      | ComfyUI                                    |
|                | `comfy launch --cuda-device 0`             |
| `curl wttr.in` | Weather                                    |

---

## Clipboard & Utils

| Command       | Description                    |
| ------------- | ------------------------------ |
| `cwd` / `ccd` | Copy current path to clipboard |
| `which`       | Show command source path       |
