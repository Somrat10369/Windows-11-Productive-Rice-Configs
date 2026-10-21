# GlazeWM Configuration

A minimal, ergonomic, and keyboard-driven window manager configuration for Windows 11.

![Glaze WM](../Assets/Glaze_logo.png)

## Keybindings

### Window Focus

| Action                      | Keybinding        |
| --------------------------- | ----------------- |
| Cycle focus through windows | `Alt+Shift+Space` |
| Focus left                  | `Alt+Left`        |
| Focus right                 | `Alt+Right`       |
| Focus up                    | `Alt+Up`          |
| Focus down                  | `Alt+Down`        |

### Window Controls

| Action          | Keybinding |
| --------------- | ---------- |
| Minimize window | `Alt+Z`    |
| Maximize window | `Alt+C`    |
| Close window    | `Alt+X`    |

### Window Resize

| Action       | Keybinding |
| ------------ | ---------- |
| Resize up    | `Alt+I`    |
| Resize left  | `Alt+J`    |
| Resize down  | `Alt+K`    |
| Resize right | `Alt+L`    |

### Window Movement

| Action     | Keybinding        |
| ---------- | ----------------- |
| Move left  | `Alt+Shift+Left`  |
| Move right | `Alt+Shift+Right` |
| Move up    | `Alt+Shift+Up`    |
| Move down  | `Alt+Shift+Down`  |

### Workspace Navigation

| Action                       | Keybinding                          |
| ---------------------------- | ----------------------------------- |
| Focus workspace 1-9          | `Alt+1` through `Alt+9`             |
| Move window to workspace 1-9 | `Alt+Shift+1` through `Alt+Shift+9` |

### System Utilities

| Action                  | Keybinding        |
| ----------------------- | ----------------- |
| Launch Windows Terminal | `Alt+Shift+Enter` |
| Launch MyDockFinder     | `Alt+Shift+Home`  |
| Launch Task Manager     | `Alt+Shift+End`   |

### Configuration

| Action        | Keybinding    |
| ------------- | ------------- |
| Reload config | `Alt+Shift+R` |
| Exit GlazeWM  | `Alt+Shift+E` |

## Installation

1. Download GlazeWM from the official repository
2. Copy this configuration to your GlazeWM config directory
3. Restart GlazeWM or reload the configuration

## Requirements

- [GlazeWM](https:/github.com/glzr-ioglazewm/releaseslatest) `wingetinstall GlazeWM`
- [GatGWM](https:/github.comDutch-Raptorglazetiler) foralternating tiling.
- [Taskbar Hide](https://github.comamnweb/thide)

## Troubleshooting

### Windows not tiling

- Check that the window isn't in the ignore list

- Try cycling focus with `Alt+Shift+Space`
- Verify the window isn't fullscreen

### Cursor not jumping

- Ensure `cursor_jump.enabled` is set to `true`
- Check that focus follows cursor is disabled

### Config not reloading

- Try `Alt+Shift+R` manually
- Check for syntax errors in the configuration file
