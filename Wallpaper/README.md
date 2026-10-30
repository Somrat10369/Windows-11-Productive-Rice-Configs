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
- **Color palettes:** [Browse all Pywal palette files](./Color%20pallets/)

## Gallery

Gallery previews are generated as 640px WebP images (quality 78). Select any preview to open the original full-resolution wallpaper.

The gallery uses a fixed three-column table, keeping the display to a maximum of three wallpapers per row at every screen width.

<table>
<tbody>
<tr>
<td align="center"><a href="./Wallpapers/001.png"><img src="./Thumbnails/001.webp" alt="Wallpaper 001" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/002.png"><img src="./Thumbnails/002.webp" alt="Wallpaper 002" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/003.png"><img src="./Thumbnails/003.webp" alt="Wallpaper 003" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/004.png"><img src="./Thumbnails/004.webp" alt="Wallpaper 004" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/005.jpg"><img src="./Thumbnails/005.webp" alt="Wallpaper 005" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/006.png"><img src="./Thumbnails/006.webp" alt="Wallpaper 006" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/007.png"><img src="./Thumbnails/007.webp" alt="Wallpaper 007" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/008.png"><img src="./Thumbnails/008.webp" alt="Wallpaper 008" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/009.jpg"><img src="./Thumbnails/009.webp" alt="Wallpaper 009" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/010.png"><img src="./Thumbnails/010.webp" alt="Wallpaper 010" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/011.png"><img src="./Thumbnails/011.webp" alt="Wallpaper 011" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/012.png"><img src="./Thumbnails/012.webp" alt="Wallpaper 012" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/013.png"><img src="./Thumbnails/013.webp" alt="Wallpaper 013" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/014.png"><img src="./Thumbnails/014.webp" alt="Wallpaper 014" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/015.png"><img src="./Thumbnails/015.webp" alt="Wallpaper 015" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/016.png"><img src="./Thumbnails/016.webp" alt="Wallpaper 016" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/017.jpg"><img src="./Thumbnails/017.webp" alt="Wallpaper 017" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/018.png"><img src="./Thumbnails/018.webp" alt="Wallpaper 018" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/019.png"><img src="./Thumbnails/019.webp" alt="Wallpaper 019" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/020.png"><img src="./Thumbnails/020.webp" alt="Wallpaper 020" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/021.png"><img src="./Thumbnails/021.webp" alt="Wallpaper 021" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/022.png"><img src="./Thumbnails/022.webp" alt="Wallpaper 022" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/023.png"><img src="./Thumbnails/023.webp" alt="Wallpaper 023" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/024.png"><img src="./Thumbnails/024.webp" alt="Wallpaper 024" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/025.jpg"><img src="./Thumbnails/025.webp" alt="Wallpaper 025" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/026.png"><img src="./Thumbnails/026.webp" alt="Wallpaper 026" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/027.png"><img src="./Thumbnails/027.webp" alt="Wallpaper 027" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/028.png"><img src="./Thumbnails/028.webp" alt="Wallpaper 028" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/029.png"><img src="./Thumbnails/029.webp" alt="Wallpaper 029" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/030.png"><img src="./Thumbnails/030.webp" alt="Wallpaper 030" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/031.png"><img src="./Thumbnails/031.webp" alt="Wallpaper 031" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/032.jpg"><img src="./Thumbnails/032.webp" alt="Wallpaper 032" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/033.png"><img src="./Thumbnails/033.webp" alt="Wallpaper 033" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/034.png"><img src="./Thumbnails/034.webp" alt="Wallpaper 034" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/035.jpg"><img src="./Thumbnails/035.webp" alt="Wallpaper 035" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/036.png"><img src="./Thumbnails/036.webp" alt="Wallpaper 036" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/037.jpg"><img src="./Thumbnails/037.webp" alt="Wallpaper 037" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/038.jpg"><img src="./Thumbnails/038.webp" alt="Wallpaper 038" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/039.png"><img src="./Thumbnails/039.webp" alt="Wallpaper 039" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/040.png"><img src="./Thumbnails/040.webp" alt="Wallpaper 040" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/041.png"><img src="./Thumbnails/041.webp" alt="Wallpaper 041" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/042.png"><img src="./Thumbnails/042.webp" alt="Wallpaper 042" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/043.png"><img src="./Thumbnails/043.webp" alt="Wallpaper 043" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/044.png"><img src="./Thumbnails/044.webp" alt="Wallpaper 044" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/045.png"><img src="./Thumbnails/045.webp" alt="Wallpaper 045" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/046.png"><img src="./Thumbnails/046.webp" alt="Wallpaper 046" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/047.png"><img src="./Thumbnails/047.webp" alt="Wallpaper 047" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/048.png"><img src="./Thumbnails/048.webp" alt="Wallpaper 048" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/049.png"><img src="./Thumbnails/049.webp" alt="Wallpaper 049" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/050.jpg"><img src="./Thumbnails/050.webp" alt="Wallpaper 050" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/051.png"><img src="./Thumbnails/051.webp" alt="Wallpaper 051" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/052.png"><img src="./Thumbnails/052.webp" alt="Wallpaper 052" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/053.png"><img src="./Thumbnails/053.webp" alt="Wallpaper 053" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/054.png"><img src="./Thumbnails/054.webp" alt="Wallpaper 054" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/055.png"><img src="./Thumbnails/055.webp" alt="Wallpaper 055" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/056.jpg"><img src="./Thumbnails/056.webp" alt="Wallpaper 056" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/057.png"><img src="./Thumbnails/057.webp" alt="Wallpaper 057" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/058.png"><img src="./Thumbnails/058.webp" alt="Wallpaper 058" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/059.png"><img src="./Thumbnails/059.webp" alt="Wallpaper 059" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/060.jpg"><img src="./Thumbnails/060.webp" alt="Wallpaper 060" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/061.jpg"><img src="./Thumbnails/061.webp" alt="Wallpaper 061" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/062.jpg"><img src="./Thumbnails/062.webp" alt="Wallpaper 062" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/063.jpg"><img src="./Thumbnails/063.webp" alt="Wallpaper 063" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/064.png"><img src="./Thumbnails/064.webp" alt="Wallpaper 064" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/065.png"><img src="./Thumbnails/065.webp" alt="Wallpaper 065" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/066.png"><img src="./Thumbnails/066.webp" alt="Wallpaper 066" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/067.png"><img src="./Thumbnails/067.webp" alt="Wallpaper 067" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/068.png"><img src="./Thumbnails/068.webp" alt="Wallpaper 068" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/069.png"><img src="./Thumbnails/069.webp" alt="Wallpaper 069" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/070.jpg"><img src="./Thumbnails/070.webp" alt="Wallpaper 070" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/071.png"><img src="./Thumbnails/071.webp" alt="Wallpaper 071" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/072.png"><img src="./Thumbnails/072.webp" alt="Wallpaper 072" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/073.jpg"><img src="./Thumbnails/073.webp" alt="Wallpaper 073" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/074.png"><img src="./Thumbnails/074.webp" alt="Wallpaper 074" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/075.png"><img src="./Thumbnails/075.webp" alt="Wallpaper 075" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/076.png"><img src="./Thumbnails/076.webp" alt="Wallpaper 076" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/077.png"><img src="./Thumbnails/077.webp" alt="Wallpaper 077" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/078.jpg"><img src="./Thumbnails/078.webp" alt="Wallpaper 078" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/079.jpg"><img src="./Thumbnails/079.webp" alt="Wallpaper 079" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/080.jpg"><img src="./Thumbnails/080.webp" alt="Wallpaper 080" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/081.jpg"><img src="./Thumbnails/081.webp" alt="Wallpaper 081" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/082.jpg"><img src="./Thumbnails/082.webp" alt="Wallpaper 082" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/083.jpg"><img src="./Thumbnails/083.webp" alt="Wallpaper 083" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/084.jpg"><img src="./Thumbnails/084.webp" alt="Wallpaper 084" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/085.jpg"><img src="./Thumbnails/085.webp" alt="Wallpaper 085" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/086.png"><img src="./Thumbnails/086.webp" alt="Wallpaper 086" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/087.jpg"><img src="./Thumbnails/087.webp" alt="Wallpaper 087" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/088.jpg"><img src="./Thumbnails/088.webp" alt="Wallpaper 088" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/089.jpg"><img src="./Thumbnails/089.webp" alt="Wallpaper 089" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/090.jpg"><img src="./Thumbnails/090.webp" alt="Wallpaper 090" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/091.jpg"><img src="./Thumbnails/091.webp" alt="Wallpaper 091" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/092.png"><img src="./Thumbnails/092.webp" alt="Wallpaper 092" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/093.png"><img src="./Thumbnails/093.webp" alt="Wallpaper 093" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/094.jpg"><img src="./Thumbnails/094.webp" alt="Wallpaper 094" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/095.jpg"><img src="./Thumbnails/095.webp" alt="Wallpaper 095" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/096.jpg"><img src="./Thumbnails/096.webp" alt="Wallpaper 096" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/097.jpg"><img src="./Thumbnails/097.webp" alt="Wallpaper 097" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/098.png"><img src="./Thumbnails/098.webp" alt="Wallpaper 098" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/099.jpg"><img src="./Thumbnails/099.webp" alt="Wallpaper 099" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/100.jpg"><img src="./Thumbnails/100.webp" alt="Wallpaper 100" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/101.png"><img src="./Thumbnails/101.webp" alt="Wallpaper 101" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/102.jpg"><img src="./Thumbnails/102.webp" alt="Wallpaper 102" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/103.jpg"><img src="./Thumbnails/103.webp" alt="Wallpaper 103" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/104.png"><img src="./Thumbnails/104.webp" alt="Wallpaper 104" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/105.jpg"><img src="./Thumbnails/105.webp" alt="Wallpaper 105" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/106.jpg"><img src="./Thumbnails/106.webp" alt="Wallpaper 106" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/107.jpg"><img src="./Thumbnails/107.webp" alt="Wallpaper 107" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/108.jpg"><img src="./Thumbnails/108.webp" alt="Wallpaper 108" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/109.jpg"><img src="./Thumbnails/109.webp" alt="Wallpaper 109" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/110.jpg"><img src="./Thumbnails/110.webp" alt="Wallpaper 110" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/111.jpg"><img src="./Thumbnails/111.webp" alt="Wallpaper 111" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/112.jpg"><img src="./Thumbnails/112.webp" alt="Wallpaper 112" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/113.jpg"><img src="./Thumbnails/113.webp" alt="Wallpaper 113" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/114.png"><img src="./Thumbnails/114.webp" alt="Wallpaper 114" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/115.jpg"><img src="./Thumbnails/115.webp" alt="Wallpaper 115" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/116.jpg"><img src="./Thumbnails/116.webp" alt="Wallpaper 116" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/117.jpg"><img src="./Thumbnails/117.webp" alt="Wallpaper 117" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/118.jpg"><img src="./Thumbnails/118.webp" alt="Wallpaper 118" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/119.jpg"><img src="./Thumbnails/119.webp" alt="Wallpaper 119" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/120.jpg"><img src="./Thumbnails/120.webp" alt="Wallpaper 120" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/121.jpg"><img src="./Thumbnails/121.webp" alt="Wallpaper 121" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/122.jpg"><img src="./Thumbnails/122.webp" alt="Wallpaper 122" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/123.jpg"><img src="./Thumbnails/123.webp" alt="Wallpaper 123" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/124.jpg"><img src="./Thumbnails/124.webp" alt="Wallpaper 124" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/125.jpg"><img src="./Thumbnails/125.webp" alt="Wallpaper 125" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/126.jpg"><img src="./Thumbnails/126.webp" alt="Wallpaper 126" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/127.jpg"><img src="./Thumbnails/127.webp" alt="Wallpaper 127" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/128.jpg"><img src="./Thumbnails/128.webp" alt="Wallpaper 128" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/129.jpg"><img src="./Thumbnails/129.webp" alt="Wallpaper 129" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/130.jpg"><img src="./Thumbnails/130.webp" alt="Wallpaper 130" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/131.jpg"><img src="./Thumbnails/131.webp" alt="Wallpaper 131" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/132.jpg"><img src="./Thumbnails/132.webp" alt="Wallpaper 132" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/133.jpg"><img src="./Thumbnails/133.webp" alt="Wallpaper 133" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/134.jpg"><img src="./Thumbnails/134.webp" alt="Wallpaper 134" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/135.jpg"><img src="./Thumbnails/135.webp" alt="Wallpaper 135" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/136.jpg"><img src="./Thumbnails/136.webp" alt="Wallpaper 136" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/137.jpg"><img src="./Thumbnails/137.webp" alt="Wallpaper 137" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/138.png"><img src="./Thumbnails/138.webp" alt="Wallpaper 138" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/139.jpg"><img src="./Thumbnails/139.webp" alt="Wallpaper 139" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/140.png"><img src="./Thumbnails/140.webp" alt="Wallpaper 140" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/141.png"><img src="./Thumbnails/141.webp" alt="Wallpaper 141" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/142.png"><img src="./Thumbnails/142.webp" alt="Wallpaper 142" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/143.jpeg"><img src="./Thumbnails/143.webp" alt="Wallpaper 143" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/144.jpg"><img src="./Thumbnails/144.webp" alt="Wallpaper 144" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/145.jpg"><img src="./Thumbnails/145.webp" alt="Wallpaper 145" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/146.jpg"><img src="./Thumbnails/146.webp" alt="Wallpaper 146" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/147.jpg"><img src="./Thumbnails/147.webp" alt="Wallpaper 147" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/148.png"><img src="./Thumbnails/148.webp" alt="Wallpaper 148" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/149.jpg"><img src="./Thumbnails/149.webp" alt="Wallpaper 149" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/150.jpg"><img src="./Thumbnails/150.webp" alt="Wallpaper 150" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/151.jpg"><img src="./Thumbnails/151.webp" alt="Wallpaper 151" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/152.png"><img src="./Thumbnails/152.webp" alt="Wallpaper 152" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/153.jpg"><img src="./Thumbnails/153.webp" alt="Wallpaper 153" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/154.jpg"><img src="./Thumbnails/154.webp" alt="Wallpaper 154" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/155.png"><img src="./Thumbnails/155.webp" alt="Wallpaper 155" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/156.jpg"><img src="./Thumbnails/156.webp" alt="Wallpaper 156" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/157.jpg"><img src="./Thumbnails/157.webp" alt="Wallpaper 157" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/158.jpg"><img src="./Thumbnails/158.webp" alt="Wallpaper 158" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/159.jpg"><img src="./Thumbnails/159.webp" alt="Wallpaper 159" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/160.jpg"><img src="./Thumbnails/160.webp" alt="Wallpaper 160" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/161.jpg"><img src="./Thumbnails/161.webp" alt="Wallpaper 161" width="280" loading="lazy"></a></td>
<td align="center"><a href="./Wallpapers/162.png"><img src="./Thumbnails/162.webp" alt="Wallpaper 162" width="280" loading="lazy"></a></td>
</tr>
<tr>
<td align="center"><a href="./Wallpapers/163.png"><img src="./Thumbnails/163.webp" alt="Wallpaper 163" width="280" loading="lazy"></a></td>
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
