# Beginner Guide: A Better-Looking Desktop in Under an Hour

**For:** people new to Windows ricing who do not want to write code.  
**Estimated time:** 40–55 minutes, excluding long downloads.  
**Difficulty:** Easy.

The goal is a visible improvement without having to learn PowerShell, edit YAML, or configure a tiling window manager. You do **not** need to install the whole repository. These steps are a suggested first pass; verify each tool's current instructions before installing it.

## Before you begin

- [ ] Save your current wallpaper and note your Windows personalization settings.
- [ ] Create a restore point if you plan to use system-modification tools.
- [ ] Keep a copy of any settings you replace.
- [ ] Download software from its official project page and review its permissions.

## Step-by-step

| Step | What you'll do | Estimated time | Visual impact |
|---|---|---:|---|
| 1 | Choose a wallpaper and a matching color palette | 5–10 min | Very high |
| 2 | Set Windows theme and accent colors | 5–10 min | High |
| 3 | Try a cursor theme | 5 min | Medium |
| 4 | Apply a small number of carefully chosen Windhawk tweaks | 10–15 min | High |
| 5 | Install and configure Flow Launcher (optional) | 5–10 min | Medium |
| 6 | Review the desktop and undo anything you dislike | 5 min | Medium |

**Target total:** about 40–55 minutes if you skip optional steps and downloads are quick.

### 1. Pick your wallpaper

Start with the [wallpaper collection](../Wallpaper/). Choose one image and use it as your desktop background through **Settings → Personalization → Background**.

**Why first?** The wallpaper establishes the visual direction for the rest of the desktop. Pick something you can comfortably look at all day, not just something that looks good in a screenshot.

### 2. Match Windows colors

Open **Settings → Personalization → Colors**. Choose light or dark mode and set an accent color that works with the wallpaper.

Keep the first pass simple. You can explore automatic, wallpaper-derived colors later in the [Pywal configuration](../Pywal/), but dynamic theming is not required for this guide.

### 3. Customize the cursor (optional)

Explore the [Dark Cursor Pack](../Dark%20Cursor%20Pack/) and follow any included instructions. If you replace the cursor scheme, note the original setting first so you can restore it.

### 4. Choose a few Windhawk tweaks

Read the [Windhawk configuration notes](../Windhawk/) before applying modifications. Start with one visual change, restart or refresh as instructed, and check that normal Windows interactions still work.

> **Caution:** system-interface modifications can conflict with Windows updates or other tweaks. Avoid installing a large batch at once. If the taskbar or shell behaves strangely, disable the last modification and test again.

### 5. Add Flow Launcher (optional)

The [Flow Launcher configuration](../Flow%20Launcher/) documents this repository's setup. Install it only if you want a keyboard-driven way to launch apps and search. Confirm the default hotkey and avoid overlapping it with shortcuts you already use.

### 6. Review and keep what works

- [ ] Check the desktop at your usual screen brightness.
- [ ] Confirm text, icons, and the taskbar remain readable.
- [ ] Test the Start menu, taskbar, search, and common apps.
- [ ] Remove any tweak that feels fragile or distracting.

## What next?

If you want tiling window management, a custom status bar, and a more productive terminal workflow, continue to the [Intermediate Guide](intermediate.md). If all you wanted was a cleaner desktop, stop here. Installing more tools is not a personality requirement.

## Troubleshooting

- **A tweak breaks the interface:** disable the most recent Windhawk modification and retest.
- **The colors look inconsistent:** check Windows light/dark mode and app-specific theme settings.
- **A cursor does not apply:** revisit the pack's own instructions and Windows mouse settings.
- **Something differs from the screenshots:** your Windows build, display scaling, or app version may differ.

For component-specific details, use the [guide index](README.md) and the linked component READMEs.
