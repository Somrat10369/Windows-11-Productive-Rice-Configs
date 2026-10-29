# Wallpaper Collection

<div align = "center">

![alt text](../Assets/wallpaper.gif)

</div>

## Workflow

```mermaid
flowchart TD

Wallpaper["Choose a wallpaper"]
Pywal["Pywal Analyzes the wallpaper and extracts Colors"]
Templates["Templates in .config/wal"]
Replace["Pywal fills color variables in the template"]
Configs["Pywal output the matching Config files at .cache/wal"]
Link["Link the configs with symlink or a ps1 script"]
Tada["Automatic Theme Genaraiton!"]


Wallpaper --> Pywal
Templates --> Replace
Pywal --> Configs
Replace --> Configs
Configs --> Link
Link --> Tada
```

The custom templates are in [`Pywal/templates`](../Pywal/templates/).

> They include opinionated application settings and styling, not just color placeholders.

**Back up your existing configuration files before using them, and review each template before copying it into `~/.config/wal/templates/` so you do not overwrite settings you want to keep.**

See the [Pywal setup notes](../Pywal/Readme.md) for the example script and YASB wallpaper hook.

## Gallery

<p>
<a href="./001.png"><img src="./001.png" alt="Wallpaper 001" width="280" loading="lazy"></a>
<a href="./002.png"><img src="./002.png" alt="Wallpaper 002" width="280" loading="lazy"></a>
<a href="./003.png"><img src="./003.png" alt="Wallpaper 003" width="280" loading="lazy"></a>
<a href="./004.png"><img src="./004.png" alt="Wallpaper 004" width="280" loading="lazy"></a>
<a href="./005.jpg"><img src="./005.jpg" alt="Wallpaper 005" width="280" loading="lazy"></a>
<a href="./006.png"><img src="./006.png" alt="Wallpaper 006" width="280" loading="lazy"></a>
<a href="./007.png"><img src="./007.png" alt="Wallpaper 007" width="280" loading="lazy"></a>
<a href="./008.png"><img src="./008.png" alt="Wallpaper 008" width="280" loading="lazy"></a>
<a href="./009.jpg"><img src="./009.jpg" alt="Wallpaper 009" width="280" loading="lazy"></a>
<a href="./010.png"><img src="./010.png" alt="Wallpaper 010" width="280" loading="lazy"></a>
<a href="./011.png"><img src="./011.png" alt="Wallpaper 011" width="280" loading="lazy"></a>
<a href="./012.png"><img src="./012.png" alt="Wallpaper 012" width="280" loading="lazy"></a>
<a href="./013.png"><img src="./013.png" alt="Wallpaper 013" width="280" loading="lazy"></a>
<a href="./014.png"><img src="./014.png" alt="Wallpaper 014" width="280" loading="lazy"></a>
<a href="./015.png"><img src="./015.png" alt="Wallpaper 015" width="280" loading="lazy"></a>
<a href="./016.png"><img src="./016.png" alt="Wallpaper 016" width="280" loading="lazy"></a>
<a href="./017.jpg"><img src="./017.jpg" alt="Wallpaper 017" width="280" loading="lazy"></a>
<a href="./018.png"><img src="./018.png" alt="Wallpaper 018" width="280" loading="lazy"></a>
<a href="./019.png"><img src="./019.png" alt="Wallpaper 019" width="280" loading="lazy"></a>
<a href="./020.png"><img src="./020.png" alt="Wallpaper 020" width="280" loading="lazy"></a>
<a href="./021.png"><img src="./021.png" alt="Wallpaper 021" width="280" loading="lazy"></a>
<a href="./022.png"><img src="./022.png" alt="Wallpaper 022" width="280" loading="lazy"></a>
<a href="./023.png"><img src="./023.png" alt="Wallpaper 023" width="280" loading="lazy"></a>
<a href="./024.png"><img src="./024.png" alt="Wallpaper 024" width="280" loading="lazy"></a>
<a href="./025.jpg"><img src="./025.jpg" alt="Wallpaper 025" width="280" loading="lazy"></a>
<a href="./026.png"><img src="./026.png" alt="Wallpaper 026" width="280" loading="lazy"></a>
<a href="./027.png"><img src="./027.png" alt="Wallpaper 027" width="280" loading="lazy"></a>
<a href="./028.png"><img src="./028.png" alt="Wallpaper 028" width="280" loading="lazy"></a>
<a href="./029.png"><img src="./029.png" alt="Wallpaper 029" width="280" loading="lazy"></a>
<a href="./030.png"><img src="./030.png" alt="Wallpaper 030" width="280" loading="lazy"></a>
<a href="./031.png"><img src="./031.png" alt="Wallpaper 031" width="280" loading="lazy"></a>
<a href="./032.jpg"><img src="./032.jpg" alt="Wallpaper 032" width="280" loading="lazy"></a>
<a href="./033.png"><img src="./033.png" alt="Wallpaper 033" width="280" loading="lazy"></a>
<a href="./034.png"><img src="./034.png" alt="Wallpaper 034" width="280" loading="lazy"></a>
<a href="./035.jpg"><img src="./035.jpg" alt="Wallpaper 035" width="280" loading="lazy"></a>
<a href="./036.png"><img src="./036.png" alt="Wallpaper 036" width="280" loading="lazy"></a>
<a href="./037.jpg"><img src="./037.jpg" alt="Wallpaper 037" width="280" loading="lazy"></a>
<a href="./038.jpg"><img src="./038.jpg" alt="Wallpaper 038" width="280" loading="lazy"></a>
<a href="./039.png"><img src="./039.png" alt="Wallpaper 039" width="280" loading="lazy"></a>
<a href="./040.png"><img src="./040.png" alt="Wallpaper 040" width="280" loading="lazy"></a>
<a href="./041.png"><img src="./041.png" alt="Wallpaper 041" width="280" loading="lazy"></a>
<a href="./042.png"><img src="./042.png" alt="Wallpaper 042" width="280" loading="lazy"></a>
<a href="./043.png"><img src="./043.png" alt="Wallpaper 043" width="280" loading="lazy"></a>
<a href="./044.png"><img src="./044.png" alt="Wallpaper 044" width="280" loading="lazy"></a>
<a href="./045.png"><img src="./045.png" alt="Wallpaper 045" width="280" loading="lazy"></a>
<a href="./046.png"><img src="./046.png" alt="Wallpaper 046" width="280" loading="lazy"></a>
<a href="./047.png"><img src="./047.png" alt="Wallpaper 047" width="280" loading="lazy"></a>
<a href="./048.png"><img src="./048.png" alt="Wallpaper 048" width="280" loading="lazy"></a>
<a href="./049.png"><img src="./049.png" alt="Wallpaper 049" width="280" loading="lazy"></a>
<a href="./050.jpg"><img src="./050.jpg" alt="Wallpaper 050" width="280" loading="lazy"></a>
<a href="./051.png"><img src="./051.png" alt="Wallpaper 051" width="280" loading="lazy"></a>
<a href="./052.png"><img src="./052.png" alt="Wallpaper 052" width="280" loading="lazy"></a>
<a href="./053.png"><img src="./053.png" alt="Wallpaper 053" width="280" loading="lazy"></a>
<a href="./054.png"><img src="./054.png" alt="Wallpaper 054" width="280" loading="lazy"></a>
<a href="./055.png"><img src="./055.png" alt="Wallpaper 055" width="280" loading="lazy"></a>
<a href="./056.jpg"><img src="./056.jpg" alt="Wallpaper 056" width="280" loading="lazy"></a>
<a href="./057.png"><img src="./057.png" alt="Wallpaper 057" width="280" loading="lazy"></a>
<a href="./058.png"><img src="./058.png" alt="Wallpaper 058" width="280" loading="lazy"></a>
<a href="./059.png"><img src="./059.png" alt="Wallpaper 059" width="280" loading="lazy"></a>
<a href="./060.jpg"><img src="./060.jpg" alt="Wallpaper 060" width="280" loading="lazy"></a>
<a href="./061.jpg"><img src="./061.jpg" alt="Wallpaper 061" width="280" loading="lazy"></a>
<a href="./062.jpg"><img src="./062.jpg" alt="Wallpaper 062" width="280" loading="lazy"></a>
<a href="./063.jpg"><img src="./063.jpg" alt="Wallpaper 063" width="280" loading="lazy"></a>
<a href="./064.png"><img src="./064.png" alt="Wallpaper 064" width="280" loading="lazy"></a>
<a href="./065.png"><img src="./065.png" alt="Wallpaper 065" width="280" loading="lazy"></a>
<a href="./066.png"><img src="./066.png" alt="Wallpaper 066" width="280" loading="lazy"></a>
<a href="./067.png"><img src="./067.png" alt="Wallpaper 067" width="280" loading="lazy"></a>
<a href="./068.png"><img src="./068.png" alt="Wallpaper 068" width="280" loading="lazy"></a>
<a href="./069.png"><img src="./069.png" alt="Wallpaper 069" width="280" loading="lazy"></a>
<a href="./070.jpg"><img src="./070.jpg" alt="Wallpaper 070" width="280" loading="lazy"></a>
<a href="./071.png"><img src="./071.png" alt="Wallpaper 071" width="280" loading="lazy"></a>
<a href="./072.png"><img src="./072.png" alt="Wallpaper 072" width="280" loading="lazy"></a>
<a href="./073.jpg"><img src="./073.jpg" alt="Wallpaper 073" width="280" loading="lazy"></a>
<a href="./074.png"><img src="./074.png" alt="Wallpaper 074" width="280" loading="lazy"></a>
<a href="./075.png"><img src="./075.png" alt="Wallpaper 075" width="280" loading="lazy"></a>
<a href="./076.png"><img src="./076.png" alt="Wallpaper 076" width="280" loading="lazy"></a>
<a href="./077.png"><img src="./077.png" alt="Wallpaper 077" width="280" loading="lazy"></a>
<a href="./078.jpg"><img src="./078.jpg" alt="Wallpaper 078" width="280" loading="lazy"></a>
<a href="./079.jpg"><img src="./079.jpg" alt="Wallpaper 079" width="280" loading="lazy"></a>
<a href="./080.jpg"><img src="./080.jpg" alt="Wallpaper 080" width="280" loading="lazy"></a>
<a href="./081.jpg"><img src="./081.jpg" alt="Wallpaper 081" width="280" loading="lazy"></a>
<a href="./082.jpg"><img src="./082.jpg" alt="Wallpaper 082" width="280" loading="lazy"></a>
<a href="./083.jpg"><img src="./083.jpg" alt="Wallpaper 083" width="280" loading="lazy"></a>
<a href="./084.jpg"><img src="./084.jpg" alt="Wallpaper 084" width="280" loading="lazy"></a>
<a href="./085.jpg"><img src="./085.jpg" alt="Wallpaper 085" width="280" loading="lazy"></a>
<a href="./086.png"><img src="./086.png" alt="Wallpaper 086" width="280" loading="lazy"></a>
<a href="./087.jpg"><img src="./087.jpg" alt="Wallpaper 087" width="280" loading="lazy"></a>
<a href="./088.jpg"><img src="./088.jpg" alt="Wallpaper 088" width="280" loading="lazy"></a>
<a href="./089.jpg"><img src="./089.jpg" alt="Wallpaper 089" width="280" loading="lazy"></a>
<a href="./090.jpg"><img src="./090.jpg" alt="Wallpaper 090" width="280" loading="lazy"></a>
<a href="./091.jpg"><img src="./091.jpg" alt="Wallpaper 091" width="280" loading="lazy"></a>
<a href="./092.png"><img src="./092.png" alt="Wallpaper 092" width="280" loading="lazy"></a>
<a href="./093.png"><img src="./093.png" alt="Wallpaper 093" width="280" loading="lazy"></a>
<a href="./094.jpg"><img src="./094.jpg" alt="Wallpaper 094" width="280" loading="lazy"></a>
<a href="./095.jpg"><img src="./095.jpg" alt="Wallpaper 095" width="280" loading="lazy"></a>
<a href="./096.jpg"><img src="./096.jpg" alt="Wallpaper 096" width="280" loading="lazy"></a>
<a href="./097.jpg"><img src="./097.jpg" alt="Wallpaper 097" width="280" loading="lazy"></a>
<a href="./098.png"><img src="./098.png" alt="Wallpaper 098" width="280" loading="lazy"></a>
<a href="./099.jpg"><img src="./099.jpg" alt="Wallpaper 099" width="280" loading="lazy"></a>
<a href="./100.jpg"><img src="./100.jpg" alt="Wallpaper 100" width="280" loading="lazy"></a>
<a href="./101.png"><img src="./101.png" alt="Wallpaper 101" width="280" loading="lazy"></a>
<a href="./102.jpg"><img src="./102.jpg" alt="Wallpaper 102" width="280" loading="lazy"></a>
<a href="./103.jpg"><img src="./103.jpg" alt="Wallpaper 103" width="280" loading="lazy"></a>
<a href="./104.png"><img src="./104.png" alt="Wallpaper 104" width="280" loading="lazy"></a>
<a href="./105.jpg"><img src="./105.jpg" alt="Wallpaper 105" width="280" loading="lazy"></a>
<a href="./106.jpg"><img src="./106.jpg" alt="Wallpaper 106" width="280" loading="lazy"></a>
<a href="./107.jpg"><img src="./107.jpg" alt="Wallpaper 107" width="280" loading="lazy"></a>
<a href="./108.jpg"><img src="./108.jpg" alt="Wallpaper 108" width="280" loading="lazy"></a>
<a href="./109.jpg"><img src="./109.jpg" alt="Wallpaper 109" width="280" loading="lazy"></a>
<a href="./110.jpg"><img src="./110.jpg" alt="Wallpaper 110" width="280" loading="lazy"></a>
<a href="./111.jpg"><img src="./111.jpg" alt="Wallpaper 111" width="280" loading="lazy"></a>
<a href="./112.jpg"><img src="./112.jpg" alt="Wallpaper 112" width="280" loading="lazy"></a>
<a href="./113.jpg"><img src="./113.jpg" alt="Wallpaper 113" width="280" loading="lazy"></a>
<a href="./114.png"><img src="./114.png" alt="Wallpaper 114" width="280" loading="lazy"></a>
<a href="./115.jpg"><img src="./115.jpg" alt="Wallpaper 115" width="280" loading="lazy"></a>
<a href="./116.jpg"><img src="./116.jpg" alt="Wallpaper 116" width="280" loading="lazy"></a>
<a href="./117.jpg"><img src="./117.jpg" alt="Wallpaper 117" width="280" loading="lazy"></a>
<a href="./118.jpg"><img src="./118.jpg" alt="Wallpaper 118" width="280" loading="lazy"></a>
<a href="./119.jpg"><img src="./119.jpg" alt="Wallpaper 119" width="280" loading="lazy"></a>
<a href="./120.jpg"><img src="./120.jpg" alt="Wallpaper 120" width="280" loading="lazy"></a>
<a href="./121.jpg"><img src="./121.jpg" alt="Wallpaper 121" width="280" loading="lazy"></a>
<a href="./122.jpg"><img src="./122.jpg" alt="Wallpaper 122" width="280" loading="lazy"></a>
<a href="./123.jpg"><img src="./123.jpg" alt="Wallpaper 123" width="280" loading="lazy"></a>
<a href="./124.jpg"><img src="./124.jpg" alt="Wallpaper 124" width="280" loading="lazy"></a>
<a href="./125.jpg"><img src="./125.jpg" alt="Wallpaper 125" width="280" loading="lazy"></a>
<a href="./126.jpg"><img src="./126.jpg" alt="Wallpaper 126" width="280" loading="lazy"></a>
<a href="./127.jpg"><img src="./127.jpg" alt="Wallpaper 127" width="280" loading="lazy"></a>
<a href="./128.jpg"><img src="./128.jpg" alt="Wallpaper 128" width="280" loading="lazy"></a>
<a href="./129.jpg"><img src="./129.jpg" alt="Wallpaper 129" width="280" loading="lazy"></a>
<a href="./130.jpg"><img src="./130.jpg" alt="Wallpaper 130" width="280" loading="lazy"></a>
<a href="./131.jpg"><img src="./131.jpg" alt="Wallpaper 131" width="280" loading="lazy"></a>
<a href="./132.jpg"><img src="./132.jpg" alt="Wallpaper 132" width="280" loading="lazy"></a>
<a href="./133.jpg"><img src="./133.jpg" alt="Wallpaper 133" width="280" loading="lazy"></a>
<a href="./134.jpg"><img src="./134.jpg" alt="Wallpaper 134" width="280" loading="lazy"></a>
<a href="./135.jpg"><img src="./135.jpg" alt="Wallpaper 135" width="280" loading="lazy"></a>
<a href="./136.jpg"><img src="./136.jpg" alt="Wallpaper 136" width="280" loading="lazy"></a>
<a href="./137.jpg"><img src="./137.jpg" alt="Wallpaper 137" width="280" loading="lazy"></a>
<a href="./138.png"><img src="./138.png" alt="Wallpaper 138" width="280" loading="lazy"></a>
<a href="./139.jpg"><img src="./139.jpg" alt="Wallpaper 139" width="280" loading="lazy"></a>
<a href="./140.png"><img src="./140.png" alt="Wallpaper 140" width="280" loading="lazy"></a>
<a href="./141.png"><img src="./141.png" alt="Wallpaper 141" width="280" loading="lazy"></a>
<a href="./142.png"><img src="./142.png" alt="Wallpaper 142" width="280" loading="lazy"></a>
<a href="./143.jpeg"><img src="./143.jpeg" alt="Wallpaper 143" width="280" loading="lazy"></a>
<a href="./144.jpg"><img src="./144.jpg" alt="Wallpaper 144" width="280" loading="lazy"></a>
<a href="./145.jpg"><img src="./145.jpg" alt="Wallpaper 145" width="280" loading="lazy"></a>
<a href="./146.jpg"><img src="./146.jpg" alt="Wallpaper 146" width="280" loading="lazy"></a>
<a href="./147.jpg"><img src="./147.jpg" alt="Wallpaper 147" width="280" loading="lazy"></a>
<a href="./148.png"><img src="./148.png" alt="Wallpaper 148" width="280" loading="lazy"></a>
<a href="./149.jpg"><img src="./149.jpg" alt="Wallpaper 149" width="280" loading="lazy"></a>
<a href="./150.jpg"><img src="./150.jpg" alt="Wallpaper 150" width="280" loading="lazy"></a>
<a href="./151.jpg"><img src="./151.jpg" alt="Wallpaper 151" width="280" loading="lazy"></a>
<a href="./152.png"><img src="./152.png" alt="Wallpaper 152" width="280" loading="lazy"></a>
<a href="./153.jpg"><img src="./153.jpg" alt="Wallpaper 153" width="280" loading="lazy"></a>
<a href="./154.jpg"><img src="./154.jpg" alt="Wallpaper 154" width="280" loading="lazy"></a>
<a href="./155.png"><img src="./155.png" alt="Wallpaper 155" width="280" loading="lazy"></a>
<a href="./156.jpg"><img src="./156.jpg" alt="Wallpaper 156" width="280" loading="lazy"></a>
<a href="./157.jpg"><img src="./157.jpg" alt="Wallpaper 157" width="280" loading="lazy"></a>
<a href="./158.jpg"><img src="./158.jpg" alt="Wallpaper 158" width="280" loading="lazy"></a>
<a href="./159.jpg"><img src="./159.jpg" alt="Wallpaper 159" width="280" loading="lazy"></a>
<a href="./160.jpg"><img src="./160.jpg" alt="Wallpaper 160" width="280" loading="lazy"></a>
<a href="./161.jpg"><img src="./161.jpg" alt="Wallpaper 161" width="280" loading="lazy"></a>
<a href="./162.png"><img src="./162.png" alt="Wallpaper 162" width="280" loading="lazy"></a>
<a href="./163.png"><img src="./163.png" alt="Wallpaper 163" width="280" loading="lazy"></a>
</p>

## ⭐ Show Some Love

If you enjoy this collection, consider leaving a **star**. It helps others discover it and motivates adding more!

<div align="center">

[![Star this repo](https://img.shields.io/badge/⭐%20Star%20this%20repo-1a1a2e?style=for-the-badge&logo=github&logoColor=f5c518)](https://github.com/Somrat10369/Windows-11-Productive-Rice-Configs)

</div>

---
