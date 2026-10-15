# Tron V02 — Pocket installation

## Installation ZIP root

The **personal installation ZIP** is made for extracting directly onto the root of the Analogue Pocket SD card:

```text
Cores/
  August and Doctor Lucy.Tron/
    core.json
    data.json
    audio.json
    video.json
    input.json
    interact.json
    variants.json
    bitstream.rbf_r
    ... other core support files ...
Platforms/
  midway_mcr2.json
  _images/
    midway_mcr2.bin
Assets/
  midway_mcr2/
    common/
      tron.rom
```

There must **not** be an enclosing `Tron-V02/` directory. The core metadata's internal platform ID is `midway_mcr2`; the user-facing platform name is **Tron**. The ROM is selected automatically through the `tron.rom` data slot; you do not need to select `Tron.json` manually.

## Manual installation

1. Power off the Pocket and mount its SD card on a computer.
2. Safeguard any existing content as appropriate; do not merge unrelated or experimental cores blindly.
3. Extract the **personal** installation archive to the SD card's **root**, retaining `Cores`, `Platforms`, `Assets` hierarchy. Do not extract the repository/source ZIP.
4. Safely eject and insert the SD card. Launch **openFPGA → Arcade → Tron**.
5. Test handheld controls and, if using Dock, the external controller mapping in [CONTROLS.md](CONTROLS.md).

Do **not** upload copyrighted ROMs to a public code repository. The repository export contains a **ROM-free** installation package; to use it, legally provide the correct local `tron.rom` at `Assets/midway_mcr2/common/tron.rom`.

## Update applications

The physical layout above is compatible with Analogue Pocket's filesystem expectations. Automatic appearance in Pocket Sync or another updater's catalog depends on that updater's own registry; folder correctness alone does not register a core as available for automatic download.

## Archive hygiene

All release ZIPs produced by the publication preparation utility are tested to reject `.DS_Store`, `._*`, `__MACOSX`, and path traversal; required files are hashed and checked after packaging. No extra macOS metadata or enclosing directory is present.
