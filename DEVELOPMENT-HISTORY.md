# Tron Analogue Pocket port — engineering history

This records engineering evidence rather than asserting broader functionality than tested.

| Date / checkpoint | Observation or result |
|---|---|
| 2026-10-13 · T02 baseline | Existing Tron gameplay implementation used as a protected baseline. The playable Twin-Stick work was staged independently. |
| 2026-10-14 · controller capture | A standalone controller logger captured raw digital/analog input from the 8BitDo Pro 2; no distinct APF rear-paddle P1/P2 signals were demonstrated. |
| T03-A2 controller integration | Added `tron_input_mapper.v`: eight-way left stick, horizontal right-stick spinner rotation, A/L2/R2 fire, preserved D-pad/shoulders/coin/start. |
| T03-A2 regression | All 18 input checks passed, including diagonals, simultaneous movement+rotation+fire, controller slot 2, and absent-slot input gating. |
| T03-A2 playable TEST | New `TronTwin_TEST` core physically exercised by the user; docked controls worked. |
| T03-A2 V02 cleanup | Rebuilt from proven controller-only project without logger. Removed debug menu and Game Definition browsing; switched to direct ROM filename. |
| 2026-10-14 · V02 build | Full Quartus compilation passed. Setup +3.076ns, hold +0.111ns; the inherited timing constraints are incompletely specified. |
| 2026-10-14 · hardware testing | User confirmed game runs docked and undocked; auto ROM loading worked. |
| 2026-10-14 · final metadata | Platform ID retained as `midway_mcr2`; menu label changed from generic Midway MCR-II to **Tron**, without FPGA recompile. |

## Current known issues and decisions

The optional controller diagnostic was removed from V02. 8BitDo Pro 2 programmable rear paddles P1/P2 were left unsupported after a failed remapping test; they must not be advertised as usable. The arcade credit system remains authentic: Start consumes one credit. No gameplay modification for automatic credits or free play was made.

## Engineering practice

Observe → Prove → Explain → Change → Retest. Preserve test logs and source hashes in the local development evidence tree; use isolated build workspaces; do not overwrite the original playable baseline. The GitHub export contains a summary and the explicit regression files, not every raw controller dump (which may include large or device-specific logs).
