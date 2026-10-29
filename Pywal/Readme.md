## Introduction

![Generate and change color-schemes on the fly](../Assets/pywal.gif)

Pywal is a Python command-line tool that generates a color palette from the dominant colors from your wallpaper.

> Since dylanaraps/pywal was archived on Apr 26, 2024, eylles/pywal16 is the de facto successor — and notably, pip install pywal on PyPI now serves pywal16

## Installation

You need python and go isntalled:

* Python: `pip install pywal16`
* Go: `go install github.com/thefryscorer/schemer2@latest`

## Setup

* Put the templates in `C:\Users\{Username}\.config\wal\templates\`
* You could run a PowerShell registry watcher But I prefer using YASBs Run After Hook with the wallpaper widget [with Linking ps1 script](../Yasb/scripts/sync-terminal.ps1):

```yaml
      run_after:
        - "wal --backend schemer2 -s -t -e -q -n -i {image}"
```

## Workflow

```mermaid
flowchart TD

Wallpaper["Choose a wallpaper"]
Pywal["Pywal Analyzes the wallpaper and extracts Colors"]
Templates["Templates in .config/wal"]
Replace["Pywal fills color variables in the template"]
Configs["Pywal output the matching Config files at .cache/wal"]
Link["Link the configs with symlink or a ps1 script"]
Tada["Automatic Theme Genaraiton!"]


Wallpaper --> Pywal
Templates --> Replace
Pywal --> Configs
Replace --> Configs
Configs --> Link
Link --> Tada
```

The custom templates are in [`Pywal/templates`](../Pywal/templates/).

> They include opinionated application settings and styling, not just color placeholders.

**Back up your existing configuration files before using them, and review each template before copying it into `~/.config/wal/templates/` so you do not overwrite settings you want to keep.**
## ⭐ Show Some Love

If you enjoy this collection, consider leaving a **star**. It helps others discover it and motivates adding more!

<div align="center">

[![Star this repo](https://img.shields.io/badge/⭐%20Star%20this%20repo-1a1a2e?style=for-the-badge&logo=github&logoColor=f5c518)](https://github.com/Somrat10369/Windows-11-Productive-Rice-Configs)

</div>


