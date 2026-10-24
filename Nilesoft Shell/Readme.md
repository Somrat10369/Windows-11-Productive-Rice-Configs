## Introduction
Nilesoft Shell is a free, open-source (MIT) context-menu manager for Windows File Explorer that lets you add, remove, modify, and style right-click menu items, and is configured entirely through a plain-text file, `shell.nss`

![Pic](../Assets/Nilesoft_Shell.png)

## Installation

* Winget: `winget install -e --id Nilesoft.Shell`
* Scoop: `scoop install nilesoft-shell`
* Choco: `choco install nilesoft-shell`

After install, run shell.exe as Administrator and click Register (or use Shift+right-click taskbar → Shell → Register), then restart Explorer.

## Setup

Paste the files into `C:\Program Files\Nilesoft Shell\`.

It should look like:

 C:\Program Files\Nilesoft Shell\
├──  imports
│   ├──  develop.nss
│   ├──  file-manage.nss
│   ├──  goto.nss
│   ├──  images.nss
│   ├──  modify.nss
│   ├──  taskbar.nss
│   ├──  terminal.nss
│   └──  theme.nss
├──  LICENSE
├──  readme.txt
├──  shell.dll
├──  shell.exe
├──  shell.log
└──  shell.nss


