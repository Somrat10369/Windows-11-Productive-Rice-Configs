#!/usr/bin/env python3
"""Generate optimized WebP previews and rebuild the wallpaper README gallery."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

from PIL import Image, ImageOps

ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIR = ROOT / "Wallpapers"
THUMB_DIR = ROOT / "Thumbnails"
README = ROOT / "README.md"
MANIFEST = THUMB_DIR / ".manifest.json"
SUPPORTED = {".png", ".jpg", ".jpeg", ".webp", ".bmp", ".tif", ".tiff"}
MAX_WIDTH = 640
QUALITY = 78


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as file:
        for chunk in iter(lambda: file.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def make_thumbnail(source: Path, destination: Path) -> None:
    with Image.open(source) as original:
        image = ImageOps.exif_transpose(original)
        if image.width > MAX_WIDTH:
            height = round(image.height * MAX_WIDTH / image.width)
            image = image.resize((MAX_WIDTH, height), Image.Resampling.LANCZOS)

        # Preserve transparency where present; otherwise use compact RGB.
        image = image.convert("RGBA" if "A" in image.getbands() else "RGB")
        destination.parent.mkdir(parents=True, exist_ok=True)
        image.save(destination, "WEBP", quality=QUALITY, method=6)


def rebuild_gallery(files: list[Path]) -> None:
    cells = []
    for source in files:
        name = source.name
        preview = f"./Thumbnails/{source.stem}.webp"
        original = f"./Wallpapers/{name}"
        cells.append(
            f'<td align="center"><a href="{original}">'
            f'<img src="{preview}" alt="Wallpaper {source.stem}" '
            f'width="280" loading="lazy"></a></td>'
        )

    rows = []
    for index in range(0, len(cells), 3):
        row = cells[index:index + 3]
        row.extend(["<td></td>"] * (3 - len(row)))
        rows.append("<tr>\n" + "\n".join(row) + "\n</tr>")

    gallery = (
        "## Gallery\n\n"
        "Gallery previews are generated as 640px WebP images (quality 78). "
        "Select any preview to open the original full-resolution wallpaper.\n\n"
        "The gallery uses a fixed three-column table, keeping the display "
        "to a maximum of three wallpapers per row at every screen width.\n\n"
        "<table>\n<tbody>\n"
        + "\n".join(rows)
        + "\n</tbody>\n</table>\n\n"
    )

    text = README.read_text(encoding="utf-8")
    pattern = r"## Gallery\n.*?(?=## ⭐ Show Some Love)"
    updated, count = re.subn(pattern, lambda _: gallery, text, count=1, flags=re.S)
    if count != 1:
        raise RuntimeError("Could not locate the Gallery section in Wallpaper/README.md")
    README.write_text(updated, encoding="utf-8")


def main() -> None:
    THUMB_DIR.mkdir(parents=True, exist_ok=True)
    files = sorted(
        (path for path in SOURCE_DIR.iterdir()
         if path.is_file() and path.suffix.lower() in SUPPORTED),
        key=lambda path: path.name.lower(),
    )

    previous = {}
    if MANIFEST.exists():
        previous = json.loads(MANIFEST.read_text(encoding="utf-8"))

    current = {}
    generated = 0
    skipped = 0

    for source in files:
        key = source.name
        digest = sha256(source)
        destination = THUMB_DIR / f"{source.stem}.webp"
        current[key] = digest

        if previous.get(key) == digest and destination.exists():
            skipped += 1
            continue

        make_thumbnail(source, destination)
        generated += 1

    expected = {f"{source.stem}.webp" for source in files}
    for stale in THUMB_DIR.glob("*.webp"):
        if stale.name not in expected:
            stale.unlink()

    MANIFEST.write_text(
        json.dumps(current, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    rebuild_gallery(files)
    print(
        f"Wallpapers: {len(files)} | generated/updated: {generated} | "
        f"unchanged: {skipped} | previews: {len(expected)}"
    )


if __name__ == "__main__":
    main()
