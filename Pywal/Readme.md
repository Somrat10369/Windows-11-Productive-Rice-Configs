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
* You could run a PowerShell registry watcher like
  
```pwsh

  # wal-watch.ps1 — run at startup or in a background window
$last = (Get-ItemProperty 'HKCU:\Control Panel\Desktop').Wallpaper

while ($true) {
    Start-Sleep -Seconds 5
    $current = (Get-ItemProperty 'HKCU:\Control Panel\Desktop').Wallpaper
    if ($current -and $current -ne $last) {
        $last = $current
        Write-Host "Wallpaper changed → $current"
        Update-WalTheme -Backend schemer2 current wallpaper, regenerates palette + WT colors
    }
}
```

But I prefer using YASBs Run After Hook with the wall paper widget:

```yaml
      run_after:
        - "wal --backend schemer2 -s -t -e -q -n -i {image}"
```
