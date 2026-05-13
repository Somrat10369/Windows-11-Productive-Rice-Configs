# CLAUDE.md — YASB Configuration Project
> Karpathy-style behavioral guidelines + project context for `config.yaml` & `style.css`.
> Merge with any session-level instructions. These rules override generic defaults.

---

## 0. Identity & Scope

This project produces **two files only**:
- `config.yaml` — YASB bar configuration
- `style.css` — YASB visual theme (Catppuccin Mocha base, experimental UI/UX)

Do not touch anything outside these two files unless explicitly told to.
Do not create helper scripts, README files, or extra modules unless asked.

### Source of Truth — Local Docs

**YASB is on version 2.0. The CSS engine and config schema have changed significantly. Old knowledge is stale — always verify against local docs first.**

All official YASB 2.0 documentation is available locally at:
```
C:\Essantials\Documents\Code\Win 11 Config\config\yasb\yasb\docs\
```

**Before writing any YAML key or CSS rule you are unsure about:**
1. Read the relevant doc file from that directory first.
2. Cross-reference against the widget's doc page.
3. Only then write the code.

Do not guess from memory. YASB 2.0 introduced breaking changes — old QSS patterns, `container_padding`, `container_shadow`, and server_monitor string lists are all gone. If a key isn't in the local docs, say so and ask.

---

## 1. Think Before Coding (Karpathy Rule #1)

**Don't assume. Surface tradeoffs before touching files.**

- Before any edit: state what you're changing and why.
- If a widget option has multiple valid approaches, list them — don't silently pick one.
- If a YAML key is ambiguous or undocumented, say so. Ask.
- If the requested change conflicts with an existing default, flag it explicitly.
- Never guess at YASB widget option names. Check known schema first.

**Forbidden assumptions:**
- Don't assume monitor count, resolution, or DPI.
- Don't assume font availability — only use fonts confirmed in the project or Nerd Fonts.
- Don't assume widget defaults are safe to omit — YASB is strict about required keys.

---

## 2. Simplicity First (Karpathy Rule #2)

**Minimum YAML/CSS that achieves the visual goal. Nothing speculative.**

- No extra widgets not in the widget list.
- No CSS classes for widgets that don't exist.
- No `!important` overrides unless fixing a confirmed specificity bug.
- No placeholder comments like `# TODO: add later`.
- No animation keyframes unless the UI brief specifically calls for them.

If a CSS block exceeds ~15 lines, ask: "Is this doing one thing?" If not, split or simplify.

---

## 3. Surgical Changes (Karpathy Rule #3)

**Touch only what the task requires.**

- Editing one widget's callbacks → don't touch other widgets' callbacks.
- Fixing a color variable → don't reorder the entire CSS variables block.
- Match existing YAML indentation (2 spaces). Match existing CSS formatting.
- If you spot a misconfigured unrelated widget, **mention it in a comment** — don't silently fix it.

**Diff test:** Every changed line must trace to the user's request. If it can't, revert it.

---

## 4. Goal-Driven Execution (Karpathy Rule #4)

**Define success criteria before looping.**

Transform tasks into verifiable goals:

| Request | Success Criteria |
|---|---|
| "Add AI chat widget" | Widget appears in left bar, Ollama endpoint resolves, models listed correctly |
| "Fix GPU callback" | Right-click toggles label; no other widget callbacks changed |
| "Restyle clock" | Clock matches Catppuccin palette; no other widget styles changed |
| "New animation" | Animates on the correct trigger; no layout shift; 60fps-safe |

For multi-step tasks, state a plan first:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
```

---

## 5. Project Defaults — config.yaml

These are **canonical defaults**. Never overwrite without explicit instruction.

### Bar Layout
```yaml
# Left → Center → Right widget order
left:   [power_menu, notes, todo, bin, ai_chat, glazewm_workspaces]
center: [cpu, gpu, pomodoro, memory, disk]
right:  [systray, wallpapers, brightness, wifi, open_meteo, volume, clock, notifications]
```

### Bar Window
```yaml
window_flags:
  always_on_top: false
  windows_app_bar: true
  hide_on_fullscreen: true
dimensions:
  width: '100%'
  height: 36
padding:
  top: 3
  left: 6
  bottom: 0
  right: 6
```

### Widget: AI Chat
```yaml
providers:
  - provider: 'Ollama'
    api_endpoint: 'http://localhost:11434/v1'
    credential: 'ollama'
    models:
      - name: 'gemma4:e4b'
        label: 'Gemma4 e4b'
        default: true
      - name: 'qwen3.5:latest'
        label: 'Qwen3.5 latest'
      - name: 'huihui_ai/qwen3.5-abliterated:9b'
        label: 'Qwen 3.5 abliterated'
      - name: 'qwen2.5-coder:1.5b-base'
        label: 'Qwen 2.5 Coder 1.5b'
      - name: 'nomic-embed-text:latest'
        label: 'Nomic Embed Text'
```

### Widget: CPU
```yaml
callbacks:
  on_left: 'toggle_menu'
  on_middle: 'do_nothing'
  on_right: 'exec cmd /c Taskmgr'
```

### Widget: Memory
```yaml
callbacks:
  on_left: 'toggle_menu'
  on_middle: 'do_nothing'
  on_right: 'toggle_label'
```

### Widget: Disk
```yaml
callbacks:
  on_left: 'toggle_label'
  on_middle: 'do_nothing'
  on_right: 'exec cmd /c start "" "C:/Users/**your username**/Desktop/wiztree.lnk"'
```

### Widget: GPU
```yaml
callbacks:
  on_left: 'toggle_menu'
  on_middle: 'do_nothing'
  on_right: 'toggle_label'
```

### Widget: WiFi
```yaml
hide_if_ethernet: true
get_exact_wifi_strength: false
callbacks:
  on_left: 'toggle_label'
  on_middle: 'exec cmd.exe /c start ms-settings:network'
  on_right: 'toggle_menu'
```

### Widget: Open Meteo
```yaml
units: 'metric'
callbacks:
  on_left: 'toggle_label'
  on_middle: 'do_nothing'
  on_right: 'toggle_card'
```

### Widget: Systray
```yaml
class_name: 'systray'
label_collapsed: "\udb81\udfc3"
label_expanded: "\udb81\udf98"
```

### Widget: GlazeWM
```yaml
glazewm:
  start_command: 'glazewm.exe start'
  stop_command: 'glazewm.exe command wm-exit'
  reload_command: 'glazewm.exe command wm-exit && glazewm.exe start'
```

### Widget: Wallpapers
```yaml
image_path: 'C:/Essantials/Documents/Code/Win 11 Config/Wallpaper'
update_interval: 60000   # auto-rotate every 1 minute
image_width: 420
image_per_page: 4
image_spacing: 10
lazy_load: true
lazy_load_delay: 10
```

---

## 6. Project Defaults — style.css

### YASB 2.0 CSS Engine — What Changed

YASB 2.0 ships a brand new CSS engine (`qt-css-engine` by Video-Nomad). **This is a major capability leap.** Previously YASB used basic QSS (limited, no animations, no gradients). Now it supports a full custom CSS pipeline that preprocesses before Qt's stylesheet parser, enabling:

| Feature | Pre-2.0 | 2.0+ |
|---|---|---|
| CSS variables (`var()`) | ❌ | ✅ |
| Animations & `@keyframes` | ❌ | ✅ (custom engine) |
| `transition` property | ❌ | ✅ |
| Gradients (`linear-gradient`, etc.) | ❌ | ✅ |
| `backdrop-filter: blur` | ❌ | ✅ |
| Shadows via CSS | ❌ | ✅ |
| Dark mode class (`.dark`) | ❌ | ✅ |
| Nested selectors | Limited | ✅ |

**2.0 breaking removals:**
- `container_padding` — removed from all widget YAML. Use CSS padding now.
- `container_shadow` — removed from all widget YAML. Use CSS `box-shadow` now.
- `server_monitor` list of strings → now list of `{name, url}` dicts.
- GlazeWM/KomorebiConfig default commands removed — must be explicit.
- Run `yasbc migrate-config` if upgrading an existing config.

**Animation hard limit:** Animations cannot be applied to sub-controls (`::item`, `::chunk`, etc.) — only to regular elements. Don't attempt `::item { transition: ... }` — it silently fails.

### CSS Engine Usage — Correct Patterns

```css
/* ✅ Variables in :root — works in 2.0 */
:root {
  --ctp-base: #1e1e2e;
}

/* ✅ Transition on hover — animated by custom engine */
.glazewm-workspaces .ws-btn {
  background: transparent;
  transition: background 200ms ease-in-out;
}
.glazewm-workspaces .ws-btn:hover {
  background: var(--ctp-surface0);
}

/* ✅ @keyframes animation on widget */
@keyframes pulse {
  0%   { opacity: 1; }
  50%  { opacity: 0.6; }
  100% { opacity: 1; }
}
.cpu-widget.high-load .label {
  animation: pulse 1s ease-in-out infinite;
}

/* ✅ Gradient background — works in 2.0 */
.clock-widget .widget-container {
  background: linear-gradient(135deg, var(--ctp-surface0), var(--ctp-mantle));
}

/* ✅ Shadow via CSS — replaces old container_shadow YAML */
.ai-chat-widget .widget-container {
  box-shadow: 0 2px 8px rgba(0,0,0,0.4);
}

/* ✅ Dark mode awareness */
.dark.yasb-bar .label { color: var(--ctp-text); }

/* ❌ INVALID — sub-control transitions don't work */
.context-menu::item { transition: background 150ms; }  /* silently fails */
```

**Easing functions supported:** `ease`, `ease-in`, `ease-out`, `ease-in-out`, `cubic-bezier(...)`, `steps(...)`. Use https://cubic-bezier.com for visualization.

**Hot reload:** Enable `watch_stylesheet: true` in config during development. Changes apply instantly without restart. Always test with hot reload before declaring a CSS change done.

### Selector Reference (2.0)

```
.yasb-bar                    → bar root
.container-left/center/right → widget group containers
.widget                      → all widgets (use sparingly)
.<name>-widget               → specific widget (e.g. .clock-widget)
.widget-container            → inner container wrapping icon+label
.label                       → text labels
.icon                        → icon spans
.dark.yasb-bar               → dark mode root
.context-menu                → right-click menus
.tooltip                     → hover tooltips
```

### Design System

**Theme:** Catppuccin Mocha — strict palette adherence.
**Goal:** State-of-the-art, mesmerising, modular. Not generic. Not safe.

```
Mocha Palette (canonical):
  --ctp-base:     #1e1e2e   ← bar background
  --ctp-mantle:   #181825   ← widget popups, menus
  --ctp-crust:    #11111b   ← deepest bg
  --ctp-surface0: #313244   ← widget bg / hover states
  --ctp-surface1: #45475a   ← borders, dividers
  --ctp-surface2: #585b70   ← secondary text
  --ctp-overlay0: #6c7086   ← muted text
  --ctp-text:     #cdd6f4   ← primary text
  --ctp-subtext1: #bac2de   ← secondary text
  --ctp-blue:     #89b4fa   ← accents, highlights
  --ctp-lavender: #b4befe   ← secondary accent
  --ctp-mauve:    #cba6f7   ← active states
  --ctp-pink:     #f38ba8   ← alerts, errors (use sparingly)
  --ctp-green:    #a6e3a1   ← success, active
  --ctp-yellow:   #f9e2af   ← warnings
  --ctp-peach:    #fab387   ← temperature, GPU heat indicators
  --ctp-sky:      #89dceb   ← network, wifi
  --ctp-teal:     #94e2d5   ← disk, storage
```

**Typography:** Use `JetBrainsMono Nerd Font Propo` (proportional variant) — avoids icon clipping on sides.

**Principles:**
- Every widget class gets its own CSS block — no shared selectors between unrelated widgets.
- Use CSS variables for ALL colors — never hardcode hex in widget rules.
- Hover states must feel tactile: subtle background shift + transition, never instant.
- Transitions: `150ms ease` for hovers, `250ms ease` for label toggles.
- **Shadows go in CSS now** (not YAML) — use `box-shadow` on `.widget-container`.
- **Padding goes in CSS now** (not YAML) — `container_padding` is dead.

**2.0 Experimental directions to use (now actually possible):**
- `@keyframes` micro-animations on widget state changes (high CPU load pulse, wifi disconnect flash)
- `linear-gradient` backgrounds on active workspace buttons
- `backdrop-filter: blur` on popup/card overlays
- Gradient text on clock using `background: linear-gradient; -webkit-background-clip: text`
- Per-widget accent colors via CSS variables (CPU → `--ctp-peach`, GPU → `--ctp-mauve`, memory → `--ctp-blue`, disk → `--ctp-teal`, wifi → `--ctp-sky`)
- Smooth label slide-in using `transition: all 250ms ease` on padding changes
- Glow on active GlazeWM workspace: `box-shadow: 0 0 8px var(--ctp-mauve)`

---

## 7. Debugging Protocol

When something breaks:

1. **Isolate** — which widget, which key, which CSS selector.
2. **State the hypothesis** — "I think X is wrong because Y."
3. **Minimal reproduction** — smallest change that tests the hypothesis.
4. **Verify before declaring fixed** — state what you checked.

Never declare "fixed" after a single edit without explaining the verification step.

---

## 8. Refactoring Rules

Only refactor when explicitly asked **or** when:
- A CSS block is duplicated 3+ times (extract to variable).
- A YAML section is copy-pasted between widgets (flag it, ask before deduplicating).

Always state: "This refactor changes no behavior — only structure."
If behavior might change, say so before refactoring.

---

## 9. UI/UX Improvement Suggestions

When you spot an improvement opportunity:
- Flag it as `[SUGGESTION]` at the bottom of your response.
- One sentence max. Don't implement it unless asked.
- Example: `[SUGGESTION] The clock widget could use --ctp-lavender for the time digits to visually separate it from the date.`

Don't batch more than 3 suggestions per response — quality over quantity.

---

## 10. Iterative Refinement Loop

For visual/style work, follow this loop:

```
1. Implement minimal version → state what it does
2. Ask: "Does this match your vision, or adjust X/Y/Z?"
3. Refine based on feedback → state only what changed
4. Repeat until locked
```

Don't skip to step 3 without step 2 confirmation on first pass of any new component.

---

## 11. File Structure Reference

```
yasb-config/
├── CLAUDE.md          ← this file
├── config.yaml        ← YASB bar configuration
└── style.css          ← YASB visual theme

# Local YASB 2.0 docs (read-only reference, never edit):
C:\Essantials\Documents\Code\Win 11 Config\config\yasb\yasb\docs\
```

That's it. Two output files. Keep scope tight.

---

## 12. Anti-Patterns (Hard Stops)

- ❌ Never add a widget not in the canonical layout without explicit approval.
- ❌ Never change `windows_app_bar: true` — breaks taskbar integration.
- ❌ Never use `color: white` or `color: black` — always use Catppuccin variables.
- ❌ Never add `overflow: hidden` to the bar root — clips popup widgets.
- ❌ Never silently change a callback action — always confirm destructive callback changes.
- ❌ Never use `px` for bar `width` — must stay `'100%'`.
- ❌ Never use `container_padding` in YAML — removed in 2.0, use CSS padding.
- ❌ Never use `container_shadow` in YAML — removed in 2.0, use CSS `box-shadow`.
- ❌ Never apply `transition` to sub-controls (`::item`, `::chunk`) — engine limitation, silently fails.
- ❌ Never write CSS from memory for 2.0 features — read local docs first.
- ❌ Never assume a YAML key still exists post-2.0 — verify in local docs.

---

*These guidelines work if: diffs are clean, suggestions come before mistakes, and the bar looks like it was designed — not generated.*
