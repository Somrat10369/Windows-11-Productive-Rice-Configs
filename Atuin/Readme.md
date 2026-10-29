<p align="center">
 <picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/atuinsh/atuin/assets/53315310/13216a1d-1ac0-4c99-b0eb-d88290fe0efd">
  <img alt="Text changing depending on mode. Light: 'So light!' Dark: 'So dark!'" src="https://github.com/atuinsh/atuin/assets/53315310/08bc86d4-a781-4aaa-8d7e-478ae6bcd129">
</picture>
</p>

<p align="center">
<em>magical shell history</em>
</p>

[Atuin](https://atuin.sh) replaces your existing shell history with a SQLite database, and records
additional context for your commands. Additionally, it provides optional and
_fully encrypted_ synchronisation of your history between machines, via an Atuin
server.

<p align="center">
  <img src="demo.gif" alt="animated" width="80%" />
</p>

## Installl

```pwsh
winget install -e Atuinsh.Atuin
```

Run setup

```pwsh
atuin setup
```

## Cache for speed

include this in your PROFILE.ps1:
```pwsh

$cacheDir = "$HOME/.cache/powershell"
if (-not (Test-Path $cacheDir)) {
    New-Item -ItemType Directory -Path $cacheDir -Force | Out-Null
}

$atuinCache = "$cacheDir/atuin.ps1"
if (-not (Test-Path $atuinCache)) {
    atuin init powershell | Set-Content -Path $atuinCache -Encoding utf8
}
. $atuinCache

```

<br>

<div align="center">

⚙️ [GitHub](https://github.com/atuinsh/atuin) &nbsp;|&nbsp; 🌐 [Website](https://atuin.sh)

</div>
