# Tron V02 (0.2.0) — release notes

**Release date:** 2026-10-14  
**Pocket-facing menu title:** Tron  
**Underlying FPGA platform identifier:** `midway_mcr2` (Midway MCR-II)  
**Authors:** August and Doctor Lucy (ChatGPT)

## Included changes

- Playable Tron port with handheld and Dock controls.
- D-pad and L/R shoulder support preserved, eight-way left analog stick, right analog horizontal turret rotation, fire on A/L2/R2.
- Simplified direct ROM loading (`tron.rom`); no Game Definition subfolder selection.
- Integrated controller diagnostic logger and diagnostic menu removed from V02.
- 521×165 openFPGA banner and correctly named `Platforms/_images/midway_mcr2.bin`.
- Separate verified personal installation ZIP and ROM-free GitHub-source export.
- Correct user-facing platform name **Tron**; Midway MCR-II maintained internally.

## Test status

User-reported physical gameplay success docked and undocked. Input simulation 18/18 PASS. Full Quartus build PASS; timing constraint coverage incomplete. Not tested on all Dock firmware/controller configurations. 8BitDo Pro 2 rear P1/P2 paddles remain unverified / unsupported.
