#  My VS Code Configuration

This repository contains my personal VS Code settings, keybindings, snippets, and extensions list. Follow the steps below to mirror this exact setup on your machine.

---

## 📂 File Structure Overview

* `settings.jsonc`: Global preferences, theme settings, and formatting rules.
* `keybindings.json`: Custom keyboard shortcuts.
* `extensions.txt` / `extensions.json`: List of must-have extensions.
* `chatLanguageModels.json`: AI and Model Context Protocol configurations.

---

## 🛠️ Installation Steps

### Step 1: Locate your VS Code User Directory
Depending on your Operating System, open the terminal or file explorer and navigate to your local VS Code configuration folder:

* **Windows:** `C:/Users/{Username}/AppData/Roaming/Code/User/`
* **macOS:** `$HOME/Library/Application Support/Code/User/`
* **Linux:** `$HOME/.config/Code/User/`

### Step 2: Copy the Configuration Files

1. Clone this repository or download the ZIP file.
2. Copy all the `.json` files from this repo directly into your local **User** directory identified in Step 1.

> *Note: Feel free to overwrite existing files, but back up your old `settings.json` first if you want to keep your previous setup!*

### Step 3: Install All Extensions Automatically

Instead of searching for every extension manually, you can bulk-install them using the command line. Open your terminal, navigate to where you downloaded this repo, and run the command for your OS:

#### 🍏 MacOS / 🐧 Linux

```bash
cat extensions.txt | xargs -L 1 code --install-extension
```

#### 🪟 Windows

```pwsh
Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
```

## ⭐ Show Some Love

If you enjoy this collection, consider leaving a **star**. It helps others discover it and motivates adding more!

<div align="center">

[![Star this repo](https://img.shields.io/badge/⭐%20Star%20this%20repo-1a1a2e?style=for-the-badge&logo=github&logoColor=f5c518)](https://github.com/Somrat10369/Windows-11-Productive-Rice-Configs)

</div>
