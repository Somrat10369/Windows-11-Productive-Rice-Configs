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

## Collection

- **Wallpapers:** [Browse all 163 wallpapers](./Wallpapers/)
- **Color palettes:** [Browse all 171 Pywal palette files](./Color%20pallets/)

## Gallery

The gallery uses a fixed three-column table, keeping the display to a maximum of three wallpapers per row at every screen width.

<table>
<tbody>
<tr>
<td align="center"><a href="./Wallpapers/001.png"><img src="./Wallpapers/001.png" alt="Wallpaper 001" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/002.png"><img src="./Wallpapers/002.png" alt="Wallpaper 002" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/003.png"><img src="./Wallpapers/003.png" alt="Wallpaper 003" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/004.png"><img src="./Wallpapers/004.png" alt="Wallpaper 004" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/005.jpg"><img src="./Wallpapers/005.jpg" alt="Wallpaper 005" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/006.png"><img src="./Wallpapers/006.png" alt="Wallpaper 006" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/007.png"><img src="./Wallpapers/007.png" alt="Wallpaper 007" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/008.png"><img src="./Wallpapers/008.png" alt="Wallpaper 008" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/009.jpg"><img src="./Wallpapers/009.jpg" alt="Wallpaper 009" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/010.png"><img src="./Wallpapers/010.png" alt="Wallpaper 010" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/011.png"><img src="./Wallpapers/011.png" alt="Wallpaper 011" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/012.png"><img src="./Wallpapers/012.png" alt="Wallpaper 012" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/013.png"><img src="./Wallpapers/013.png" alt="Wallpaper 013" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/014.png"><img src="./Wallpapers/014.png" alt="Wallpaper 014" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/015.png"><img src="./Wallpapers/015.png" alt="Wallpaper 015" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/016.png"><img src="./Wallpapers/016.png" alt="Wallpaper 016" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/017.jpg"><img src="./Wallpapers/017.jpg" alt="Wallpaper 017" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/018.png"><img src="./Wallpapers/018.png" alt="Wallpaper 018" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/019.png"><img src="./Wallpapers/019.png" alt="Wallpaper 019" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/020.png"><img src="./Wallpapers/020.png" alt="Wallpaper 020" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/021.png"><img src="./Wallpapers/021.png" alt="Wallpaper 021" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/022.png"><img src="./Wallpapers/022.png" alt="Wallpaper 022" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/023.png"><img src="./Wallpapers/023.png" alt="Wallpaper 023" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/024.png"><img src="./Wallpapers/024.png" alt="Wallpaper 024" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/025.jpg"><img src="./Wallpapers/025.jpg" alt="Wallpaper 025" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/026.png"><img src="./Wallpapers/026.png" alt="Wallpaper 026" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/027.png"><img src="./Wallpapers/027.png" alt="Wallpaper 027" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/028.png"><img src="./Wallpapers/028.png" alt="Wallpaper 028" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/029.png"><img src="./Wallpapers/029.png" alt="Wallpaper 029" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/030.png"><img src="./Wallpapers/030.png" alt="Wallpaper 030" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/031.png"><img src="./Wallpapers/031.png" alt="Wallpaper 031" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/032.jpg"><img src="./Wallpapers/032.jpg" alt="Wallpaper 032" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/033.png"><img src="./Wallpapers/033.png" alt="Wallpaper 033" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/034.png"><img src="./Wallpapers/034.png" alt="Wallpaper 034" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/035.jpg"><img src="./Wallpapers/035.jpg" alt="Wallpaper 035" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/036.png"><img src="./Wallpapers/036.png" alt="Wallpaper 036" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/037.jpg"><img src="./Wallpapers/037.jpg" alt="Wallpaper 037" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/038.jpg"><img src="./Wallpapers/038.jpg" alt="Wallpaper 038" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/039.png"><img src="./Wallpapers/039.png" alt="Wallpaper 039" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/040.png"><img src="./Wallpapers/040.png" alt="Wallpaper 040" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/041.png"><img src="./Wallpapers/041.png" alt="Wallpaper 041" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/042.png"><img src="./Wallpapers/042.png" alt="Wallpaper 042" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/043.png"><img src="./Wallpapers/043.png" alt="Wallpaper 043" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/044.png"><img src="./Wallpapers/044.png" alt="Wallpaper 044" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/045.png"><img src="./Wallpapers/045.png" alt="Wallpaper 045" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/046.png"><img src="./Wallpapers/046.png" alt="Wallpaper 046" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/047.png"><img src="./Wallpapers/047.png" alt="Wallpaper 047" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/048.png"><img src="./Wallpapers/048.png" alt="Wallpaper 048" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/049.png"><img src="./Wallpapers/049.png" alt="Wallpaper 049" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/050.jpg"><img src="./Wallpapers/050.jpg" alt="Wallpaper 050" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/051.png"><img src="./Wallpapers/051.png" alt="Wallpaper 051" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/052.png"><img src="./Wallpapers/052.png" alt="Wallpaper 052" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/053.png"><img src="./Wallpapers/053.png" alt="Wallpaper 053" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/054.png"><img src="./Wallpapers/054.png" alt="Wallpaper 054" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/055.png"><img src="./Wallpapers/055.png" alt="Wallpaper 055" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/056.jpg"><img src="./Wallpapers/056.jpg" alt="Wallpaper 056" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/057.png"><img src="./Wallpapers/057.png" alt="Wallpaper 057" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/058.png"><img src="./Wallpapers/058.png" alt="Wallpaper 058" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/059.png"><img src="./Wallpapers/059.png" alt="Wallpaper 059" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/060.jpg"><img src="./Wallpapers/060.jpg" alt="Wallpaper 060" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/061.jpg"><img src="./Wallpapers/061.jpg" alt="Wallpaper 061" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/062.jpg"><img src="./Wallpapers/062.jpg" alt="Wallpaper 062" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/063.jpg"><img src="./Wallpapers/063.jpg" alt="Wallpaper 063" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/064.png"><img src="./Wallpapers/064.png" alt="Wallpaper 064" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/065.png"><img src="./Wallpapers/065.png" alt="Wallpaper 065" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/066.png"><img src="./Wallpapers/066.png" alt="Wallpaper 066" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/067.png"><img src="./Wallpapers/067.png" alt="Wallpaper 067" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/068.png"><img src="./Wallpapers/068.png" alt="Wallpaper 068" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/069.png"><img src="./Wallpapers/069.png" alt="Wallpaper 069" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/070.jpg"><img src="./Wallpapers/070.jpg" alt="Wallpaper 070" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/071.png"><img src="./Wallpapers/071.png" alt="Wallpaper 071" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/072.png"><img src="./Wallpapers/072.png" alt="Wallpaper 072" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/073.jpg"><img src="./Wallpapers/073.jpg" alt="Wallpaper 073" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/074.png"><img src="./Wallpapers/074.png" alt="Wallpaper 074" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/075.png"><img src="./Wallpapers/075.png" alt="Wallpaper 075" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/076.png"><img src="./Wallpapers/076.png" alt="Wallpaper 076" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/077.png"><img src="./Wallpapers/077.png" alt="Wallpaper 077" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/078.jpg"><img src="./Wallpapers/078.jpg" alt="Wallpaper 078" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/079.jpg"><img src="./Wallpapers/079.jpg" alt="Wallpaper 079" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/080.jpg"><img src="./Wallpapers/080.jpg" alt="Wallpaper 080" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/081.jpg"><img src="./Wallpapers/081.jpg" alt="Wallpaper 081" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/082.jpg"><img src="./Wallpapers/082.jpg" alt="Wallpaper 082" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/083.jpg"><img src="./Wallpapers/083.jpg" alt="Wallpaper 083" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/084.jpg"><img src="./Wallpapers/084.jpg" alt="Wallpaper 084" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/085.jpg"><img src="./Wallpapers/085.jpg" alt="Wallpaper 085" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/086.png"><img src="./Wallpapers/086.png" alt="Wallpaper 086" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/087.jpg"><img src="./Wallpapers/087.jpg" alt="Wallpaper 087" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/088.jpg"><img src="./Wallpapers/088.jpg" alt="Wallpaper 088" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/089.jpg"><img src="./Wallpapers/089.jpg" alt="Wallpaper 089" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/090.jpg"><img src="./Wallpapers/090.jpg" alt="Wallpaper 090" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/091.jpg"><img src="./Wallpapers/091.jpg" alt="Wallpaper 091" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/092.png"><img src="./Wallpapers/092.png" alt="Wallpaper 092" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/093.png"><img src="./Wallpapers/093.png" alt="Wallpaper 093" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/094.jpg"><img src="./Wallpapers/094.jpg" alt="Wallpaper 094" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/095.jpg"><img src="./Wallpapers/095.jpg" alt="Wallpaper 095" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/096.jpg"><img src="./Wallpapers/096.jpg" alt="Wallpaper 096" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/097.jpg"><img src="./Wallpapers/097.jpg" alt="Wallpaper 097" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/098.png"><img src="./Wallpapers/098.png" alt="Wallpaper 098" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/099.jpg"><img src="./Wallpapers/099.jpg" alt="Wallpaper 099" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/100.jpg"><img src="./Wallpapers/100.jpg" alt="Wallpaper 100" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/101.png"><img src="./Wallpapers/101.png" alt="Wallpaper 101" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/102.jpg"><img src="./Wallpapers/102.jpg" alt="Wallpaper 102" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/103.jpg"><img src="./Wallpapers/103.jpg" alt="Wallpaper 103" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/104.png"><img src="./Wallpapers/104.png" alt="Wallpaper 104" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/105.jpg"><img src="./Wallpapers/105.jpg" alt="Wallpaper 105" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/106.jpg"><img src="./Wallpapers/106.jpg" alt="Wallpaper 106" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/107.jpg"><img src="./Wallpapers/107.jpg" alt="Wallpaper 107" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/108.jpg"><img src="./Wallpapers/108.jpg" alt="Wallpaper 108" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/109.jpg"><img src="./Wallpapers/109.jpg" alt="Wallpaper 109" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/110.jpg"><img src="./Wallpapers/110.jpg" alt="Wallpaper 110" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/111.jpg"><img src="./Wallpapers/111.jpg" alt="Wallpaper 111" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/112.jpg"><img src="./Wallpapers/112.jpg" alt="Wallpaper 112" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/113.jpg"><img src="./Wallpapers/113.jpg" alt="Wallpaper 113" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/114.png"><img src="./Wallpapers/114.png" alt="Wallpaper 114" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/115.jpg"><img src="./Wallpapers/115.jpg" alt="Wallpaper 115" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/116.jpg"><img src="./Wallpapers/116.jpg" alt="Wallpaper 116" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/117.jpg"><img src="./Wallpapers/117.jpg" alt="Wallpaper 117" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/118.jpg"><img src="./Wallpapers/118.jpg" alt="Wallpaper 118" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/119.jpg"><img src="./Wallpapers/119.jpg" alt="Wallpaper 119" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/120.jpg"><img src="./Wallpapers/120.jpg" alt="Wallpaper 120" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/121.jpg"><img src="./Wallpapers/121.jpg" alt="Wallpaper 121" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/122.jpg"><img src="./Wallpapers/122.jpg" alt="Wallpaper 122" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/123.jpg"><img src="./Wallpapers/123.jpg" alt="Wallpaper 123" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/124.jpg"><img src="./Wallpapers/124.jpg" alt="Wallpaper 124" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/125.jpg"><img src="./Wallpapers/125.jpg" alt="Wallpaper 125" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/126.jpg"><img src="./Wallpapers/126.jpg" alt="Wallpaper 126" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/127.jpg"><img src="./Wallpapers/127.jpg" alt="Wallpaper 127" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/128.jpg"><img src="./Wallpapers/128.jpg" alt="Wallpaper 128" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/129.jpg"><img src="./Wallpapers/129.jpg" alt="Wallpaper 129" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/130.jpg"><img src="./Wallpapers/130.jpg" alt="Wallpaper 130" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/131.jpg"><img src="./Wallpapers/131.jpg" alt="Wallpaper 131" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/132.jpg"><img src="./Wallpapers/132.jpg" alt="Wallpaper 132" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/133.jpg"><img src="./Wallpapers/133.jpg" alt="Wallpaper 133" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/134.jpg"><img src="./Wallpapers/134.jpg" alt="Wallpaper 134" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/135.jpg"><img src="./Wallpapers/135.jpg" alt="Wallpaper 135" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/136.jpg"><img src="./Wallpapers/136.jpg" alt="Wallpaper 136" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/137.jpg"><img src="./Wallpapers/137.jpg" alt="Wallpaper 137" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/138.png"><img src="./Wallpapers/138.png" alt="Wallpaper 138" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/139.jpg"><img src="./Wallpapers/139.jpg" alt="Wallpaper 139" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/140.png"><img src="./Wallpapers/140.png" alt="Wallpaper 140" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/141.png"><img src="./Wallpapers/141.png" alt="Wallpaper 141" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/142.png"><img src="./Wallpapers/142.png" alt="Wallpaper 142" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/143.jpeg"><img src="./Wallpapers/143.jpeg" alt="Wallpaper 143" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/144.jpg"><img src="./Wallpapers/144.jpg" alt="Wallpaper 144" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/145.jpg"><img src="./Wallpapers/145.jpg" alt="Wallpaper 145" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/146.jpg"><img src="./Wallpapers/146.jpg" alt="Wallpaper 146" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/147.jpg"><img src="./Wallpapers/147.jpg" alt="Wallpaper 147" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/148.png"><img src="./Wallpapers/148.png" alt="Wallpaper 148" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/149.jpg"><img src="./Wallpapers/149.jpg" alt="Wallpaper 149" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/150.jpg"><img src="./Wallpapers/150.jpg" alt="Wallpaper 150" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/151.jpg"><img src="./Wallpapers/151.jpg" alt="Wallpaper 151" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/152.png"><img src="./Wallpapers/152.png" alt="Wallpaper 152" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/153.jpg"><img src="./Wallpapers/153.jpg" alt="Wallpaper 153" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/154.jpg"><img src="./Wallpapers/154.jpg" alt="Wallpaper 154" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/155.png"><img src="./Wallpapers/155.png" alt="Wallpaper 155" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/156.jpg"><img src="./Wallpapers/156.jpg" alt="Wallpaper 156" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/157.jpg"><img src="./Wallpapers/157.jpg" alt="Wallpaper 157" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/158.jpg"><img src="./Wallpapers/158.jpg" alt="Wallpaper 158" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/159.jpg"><img src="./Wallpapers/159.jpg" alt="Wallpaper 159" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/160.jpg"><img src="./Wallpapers/160.jpg" alt="Wallpaper 160" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/161.jpg"><img src="./Wallpapers/161.jpg" alt="Wallpaper 161" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/162.png"><img src="./Wallpapers/162.png" alt="Wallpaper 162" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/163.png"><img src="./Wallpapers/163.png" alt="Wallpaper 163" width="280" loading="lazy"></a></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

## ⭐ Show Some Love

If you enjoy this collection, consider leaving a **star**. It helps others discover it and motivates adding more!

<div align="center">

[![Star this repo](https://img.shields.io/badge/⭐%20Star%20this%20repo-1a1a2e?style=for-the-badge&logo=github&logoColor=f5c518)](https://github.com/Somrat10369/Windows-11-Productive-Rice-Configs)

</div>

---
