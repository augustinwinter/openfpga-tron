# Tron V02 — Reproducibility and asset requirements

## Quartus PLL — preserved

The verified V02 source includes `fpga/core/mf_pllbase.sip`.

SHA-256:
`752c75273cd503db1ea268be3f17d6c901365994e0aef11e94916185639bf34e`

Four independent copies from the development evidence were
compared and found byte-identical.

The PLL support file was omitted from an earlier export,
but has now been restored.

The original successful FPGA compilation used Quartus 25.1
in the `openfpgaos-quartus-full:latest` Docker environment.

A completely fresh build from this repository has not yet
been independently performed.

## Arcade ROM

The original Tron arcade ROM is not included because
redistribution permission has not been established.

The Pocket requires the correctly assembled `tron.rom`
at `Assets/midway_mcr2/common/tron.rom`.

The ROM used in the successful hardware tests was
114,688 bytes.

Consult the original MCR-II implementation and the
project's provenance documentation for information
about ROM organization. This repository does not supply
copyrighted game ROM data.

## Timing verification

The V02 Quartus compilation passed with positive reported
timing slack. Inherited timing constraints remain incomplete.

## Development evidence

The complete intermediate build history, raw test captures
and compiler logs are preserved in the original engineering
workspace on the developer's Mac.

The repository includes the final source, compiled Pocket
bitstream, controller testbench and preservation documentation.

## Redistribution

The inherited FPGA source contains contributions from
multiple upstream projects.

Before making this repository public, review the original
source headers, dependencies and applicable licenses.

See `PROVENANCE.md`.
