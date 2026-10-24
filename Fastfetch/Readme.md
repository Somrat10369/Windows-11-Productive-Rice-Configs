## Introduciton
Fastfetch is a high-performance, open-source command-line tool used to display system and hardware information in a visually clean layout—typically alongside an ASCII or image logo of your operating system. It serves as the primary modern successor to Neofetch.

![asset](../Assets/Fastfetch.png)

## Installation

* [scoop](https://scoop.sh/#/apps?q=fastfetch): `scoop install fastfetch`
* [Chocolatey](https://community.chocolatey.org/packages/fastfetch): `choco install fastfetch`
* [winget](https://github.com/microsoft/winget-pkgs/tree/master/manifests/f/Fastfetch-cli/Fastfetch): `winget install fastfetch`

## Setup

* Drop in the [config.jsonc](config.jsonc) in `~/.config/fastfetch` (create a folder if it doesn't exists yet).
* at line 4 & 5 of the config:

```jsonc
    "type": "iterm",
    "source": "~/.config/fastfetch/logo/catppuccin_logo.png",
  ```

point fastfetch to your source image/ascii art with the `source` key. You have to change the type to:

### Image Protocol Types (Real Images)

>These types display actual image files (PNG, JPG, etc.) using specific terminal graphics protocols.

* sixel: Uses the Sixel graphics protocol; offers the widest terminal support (Windows Terminal, foot, WezTerm, mintty, xterm).
*kitty: Uses the Kitty graphics protocol; the only type that supports GIF/APNG animation (kitty, Ghostty, WezTerm).
* kitty-direct: Uses the Kitty protocol but passes the file path directly to the terminal; this is the fastest option (WezTerm, Warp, kitty, Ghostty).
* kitty-icat: Runs the kitten icat utility (requires the kitten binary in PATH; kitty only).
* iterm: Uses the iTerm2 inline image protocol (iTerm2, WezTerm, Konsole).
* chafa: Converts the image to ASCII/Unicode block art using libchafa; works in any terminal (requires build with chafa support).

### File/Text Types (ASCII Art)

> These types load pre-existing text files containing ASCII art.

* file: Loads a .txt file as ASCII art; allows color replacement using index placeholders (e.g., $1).
* file-raw: Loads a binary or pre-converted file as is, without post-processing.
* raw: Prints a pre-converted binary file exactly as stored.

## FAQ

### Q: Fastfetch shows my local IP address. Does it leak my privacy?

A local IP address (10.x.x.x, 172.x.x.x, 192.168.x.x) has nothing to do with privacy. It only has meaning if you are on the same network, for example, if you connect to the same Wi-Fi network.

Actually, the `Local IP` module is the most useful module for me personally. I (@CarterLi) have several VMs installed to test fastfetch and often need to SSH into them. With fastfetch running on shell startup, I never need to type `ip addr` manually.

If you really don't like it, you can disable the `Local IP` module in `config.jsonc`.

### Q: Where is the config file? I can't find it.

Fastfetch does not generate a config file automatically. You can use `fastfetch --gen-config` to generate one. The config file will be saved in `~/.config/fastfetch/config.jsonc` by default. See the [Wiki for details](https://github.com/fastfetch-cli/fastfetch/wiki/Configuration).

### Q: The configuration is so complex. Where is the documentation?

Fastfetch uses JSON (with comments) for configuration. I suggest using an IDE with JSON schema support (like VSCode) to edit it.

Alternatively, you can refer to the presets in the [`presets` directory](https://github.com/fastfetch-cli/fastfetch/tree/dev/presets).

The **correct** way to edit the configuration:

This is an example that [changes size prefix from MiB / GiB to MB / GB](https://github.com/fastfetch-cli/fastfetch/discussions/1014). Editor used: [helix](https://github.com/helix-editor/helix)

[![asciicast](https://asciinema.org/a/1uF6sTPGKrHKI1MVaFcikINSQ.svg)](https://asciinema.org/a/1uF6sTPGKrHKI1MVaFcikINSQ)

### Q: I WANT THE DOCUMENTATION!

[Here is the documentation](https://github.com/fastfetch-cli/fastfetch/wiki/Json-Schema). It is generated from the [JSON schema](https://github.com/fastfetch-cli/fastfetch/blob/dev/doc/json_schema.json), but you might not find it very user-friendly.

### Q: I have my own ASCII art / image file. How can I show it with fastfetch?

Try `fastfetch -l /path/to/logo`. See the [logo documentation](https://github.com/fastfetch-cli/fastfetch/wiki/Logo-options) for details.

If you just want to display the distro name in [FIGlet text](https://github.com/pwaller/pyfiglet):

```bash
# install pyfiglet and jq first
pyfiglet -s -f small_slant $(fastfetch -s os --format json | jq -r '.[0].result.name') && fastfetch -l none
```

![image](https://github.com/fastfetch-cli/fastfetch/assets/6134068/6466524e-ab8c-484f-848d-eec7ddeb7df2)

### Q: How can I change the colors of my ASCII logo?

Try `fastfetch --logo-color-[1-9] <color>`, where `[1-9]` is the index of color placeholders.

For example: `fastfetch --logo-color-1 red --logo-color-2 green`.

In JSONC, you can use:

```jsonc
{
    "logo": {
        "color": {
            "1": "red",
            "2": "green"
        }
    }
}
```
