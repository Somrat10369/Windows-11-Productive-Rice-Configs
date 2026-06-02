# 🚀 My VS Code Configuration Setup

This repository contains my personal VS Code settings, keybindings, snippets, and extensions list. Follow the steps below to mirror this exact setup on your machine.

---

## 📂 File Structure Overview

*   `settings.json`: Global preferences, theme settings, and formatting rules.
*   `keybindings.json`: Custom keyboard shortcuts.
*   `snippets/`: Custom code expansion shortcuts.
*   `extensions.txt` / `extensions.json`: List of must-have extensions.
*   `mcp.json` / `chatLanguageModels.json`: AI and Model Context Protocol configurations.

---

## 🛠️ Installation Steps

### Step 1: Locate your VS Code User Directory
Depending on your Operating System, open the terminal or file explorer and navigate to your local VS Code configuration folder:

*   **Windows:** `%APPDATA%\Code\User\`
*   **macOS:** `$HOME/Library/Application Support/Code/User/`
*   **Linux:** `$HOME/.config/Code/User/`

### Step 2: Copy the Configuration Files
1. Clone this repository or download the ZIP file.
2. Copy all the `.json` files and the `snippets/` folder from this repo directly into your local **User** directory identified in Step 1.
3. *Note: Feel free to overwrite existing files, but back up your old `settings.json` first if you want to keep your previous setup!*

### Step 3: Install All Extensions Automatically
Instead of searching for every extension manually, you can bulk-install them using the command line. Open your terminal, navigate to where you downloaded this repo, and run the command for your OS:

#### 🍏 macOS / 🐧 Linux:
```bash
cat extensions.txt | xargs -L 1 code --install-extension
