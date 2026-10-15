# Tron V02 — reproducible engineering notes

## Verified toolchain and build checkpoint

- Analogue Pocket openFPGA / Intel Cyclone V target, inherited from the proven Tron T02 working project.
- Intel Quartus Standard/Lite 25.1 toolchain in Docker image `openfpgaos-quartus-full:latest`, invoked with `--platform linux/amd64`.
- Verilog simulator: `iverilog -g2012`; test runner: `vvp`.
- Quartus compilation: `/opt/altera/quartus/bin/quartus_sh --flow compile ap_core`.
- SOF → raw RBF: `/opt/altera/quartus/bin/quartus_cpf -c ap_core.sof ap_core.rbf`.
- Final Analogue Pocket bitstream: bit-reverse **each byte** of `ap_core.rbf` into `bitstream.rbf_r`.

A successful **V02 full Quartus build** was observed on 2026-10-14. Reported worst-case timing slack: setup `+3.076 ns`, hold `+0.111 ns`, recovery `+14.986 ns`, removal `+0.853 ns`, minimum pulse width `+0.833 ns`. The timing report explicitly flagged **incomplete timing constraint coverage**. Do not present these numbers as a proof of a fully constrained design.

## Testbench command

The 18-case controller testbench is copied under `tests/` if present in the local evidence tree. From the repository root:

```sh
iverilog -g2012 -s tb_tron_input_mapper -o /tmp/tron-mapper.vvp \
  fpga/core/tron_input_mapper.v tests/tb_tron_input_mapper.sv
vvp /tmp/tron-mapper.vvp
```

Expected terminal marker: `RESULT: PASS — ALL CONTROLLER TESTS`.

## Full compilation from `fpga/`

```sh
docker run --rm --platform linux/amd64 --network none \
  --mount "type=bind,source=$PWD/fpga,target=/work" \
  --workdir /work -e HOME=/tmp \
  openfpgaos-quartus-full:latest \
  /opt/altera/quartus/bin/quartus_sh --flow compile ap_core
```

The build will write generated products under `fpga/`; keep them out of version control. Quartus/FPGA dependencies and licensing must be evaluated before attempting a fresh build on another machine. If the original project uses external IP, obtain them from legitimate sources.

## Provenance and integrity

See `release-manifest.json` in the private export and the per-artifact SHA-256 checksums. The V02 release-builder ZIPAPP from the development evidence tree is included in `tools/` when available; it documents the already validated compile and asset conversion. The publisher/exporter **does not recompile** or modify the working FPGA bitstream.
