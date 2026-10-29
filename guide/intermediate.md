# Intermediate Guide: A Keyboard-Driven Windows Workflow

**For:** users comfortable following configuration instructions and editing simple settings.  
**Estimated time:** 2–3 hours, excluding long downloads.  
**Difficulty:** Moderate.

This path builds on the visual basics and adds window management, a status bar, and a customized terminal. You can skip any component you do not need.

## Before you begin

- [ ] Read the [Beginner Guide](beginner.md), or complete only the visual steps you want.
- [ ] Back up existing configuration folders before copying anything.
- [ ] Check each component README for supported versions, prerequisites, and install steps.
- [ ] Install one component at a time and test it before moving on.

## Step-by-step

| Step | What you'll configure | Estimated time |
|---|---|---:|
| 1 | Basic wallpaper and Windows appearance | 20–40 min |
| 2 | GlazeWM window management | 20–30 min |
| 3 | YASB status bar | 20–35 min |
| 4 | WezTerm and a compatible Nerd Font | 15–25 min |
| 5 | PowerShell and Oh My Posh | 20–30 min |
| 6 | Flow Launcher and shortcuts | 10–15 min |
| 7 | Test the workflow and troubleshoot | 15–25 min |

**Target total:** roughly 2–3 hours. The actual time depends on downloads, existing settings, and how much you customize.

### 1. Establish a basic visual theme

Choose a wallpaper from [Wallpaper](../Wallpaper/) and set Windows colors. The [Beginner Guide](beginner.md) has the shorter route. Do not spend the entire session tuning colors; the workflow is the main goal here.

### 2. Set up GlazeWM

Follow the [GlazeWM documentation](../Glazewm/) for installation, configuration placement, and keybindings.

GlazeWM manages window layout and workspaces. Read the existing configuration before replacing yours, and test the basic shortcuts with a few ordinary apps before depending on them for daily work.

### 3. Configure YASB

Follow the [YASB documentation](../Yasb/). YASB provides the desktop bar and can display workspace or system information. Check any dependencies listed by its README.

Once both GlazeWM and YASB are running, verify that workspace indicators and actions behave as expected. Do not assume every bar widget works without its optional dependencies.

### 4. Set up WezTerm and a Nerd Font

Use the [WezTerm configuration](../Wezterm/) as the reference for terminal settings. Install a compatible Nerd Font if the configuration uses icon glyphs, then select it in WezTerm.

Check the terminal before proceeding. Missing icons are often a font issue rather than a broken configuration.

### 5. Add PowerShell prompt styling

Follow the [Oh My Posh configuration](../Oh%20My%20Posh/) and the instructions for any required PowerShell modules or profile changes. Back up your current PowerShell profile before editing it.

Open a new terminal and check that the prompt renders correctly. If startup errors appear, temporarily restore the previous profile and reintroduce changes one at a time.

### 6. Configure Flow Launcher (optional)

Use the [Flow Launcher configuration](../Flow%20Launcher/) if you want quick app launching and search. Check its hotkey against GlazeWM and other global shortcuts to avoid conflicts.

### 7. Test the complete workflow

- [ ] Open, move, resize, and switch between several windows.
- [ ] Check workspace changes and the YASB display.
- [ ] Launch WezTerm and verify the font and prompt.
- [ ] Test Flow Launcher if installed.
- [ ] Restart Windows once to verify startup behavior.
- [ ] Confirm that the setup still works after opening and closing common apps.

## Common problems

- **GlazeWM shortcuts do nothing:** check that the app is running and inspect its current configuration and logs.
- **YASB does not show expected information:** check the component README, dependencies, and configuration paths.
- **Terminal icons are missing:** confirm the selected font is a compatible Nerd Font.
- **PowerShell startup errors:** restore the previous profile, then add changes incrementally.
- **Hotkeys conflict:** change one binding and test it before editing more.

## What next?

The [Advanced Guide](advanced.md) covers dynamic theming, additional shell tools, deeper integration, and safer long-term maintenance. You can also use any component independently; there is no requirement to recreate the author's exact desktop.
