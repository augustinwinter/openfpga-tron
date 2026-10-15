# Tron V02 — controller assignments

## Undocked: Analogue Pocket handheld

| Pocket control | Arcade function |
|---|---|
| D-pad | Eight-direction movement; diagonals are supported |
| **A** | Fire / accelerate (as interpreted by the arcade game) |
| **L shoulder** | Rotate turret counterclockwise |
| **R shoulder** | Rotate turret clockwise |
| **Select** | Insert coin / add credit |
| **Start** | Start a one-player game; spends one credit |
| B / X / Y | No extra mapping in V02 |

**Physical hardware tested by the user: PASS (undocked gameplay).**

## Docked: 8BitDo Pro 2

| Controller control | Arcade function |
|---|---|
| Left analog stick | Eight-direction movement (including simultaneous X/Y directions) |
| Right analog stick, **horizontal axis** | Rotate turret counterclockwise / clockwise |
| D-pad | Eight-direction movement |
| **L1** | Rotate counterclockwise |
| **R1** | Rotate clockwise |
| **A** | Fire / accelerate |
| **L2 / R2** | Fire / accelerate |
| **Select / Back** | Insert coin / add credit |
| **Start** | Start a one-player game; spends one credit |
| Rear paddles **P1 / P2** | **Not supported** by this V02 configuration: mapping them to A in 8BitDo Ultimate Software did not work in the user's test |

**Physical hardware tested by the user: PASS (docked gameplay).** Controller firmware, profiles and Dock configuration can affect behavior; no broader compatibility claim is made.

## Authentic arcade behavior

Press **Select** once to add a credit, then **Start** once to play. Start spending a credit is normal for the original game, not a controller defect. No free-play modification or automatic-credit injection was introduced in V02.

## Input implementation

The V02 `tron_input_mapper.v` combines the D-pad with left-stick thresholds (nominal low `<96`, high `>160`), shoulder buttons with right-stick horizontal rotation, and A/L2/R2 as fire. Two APF controller slots are processed, gated to avoid inputs from absent controllers. No distinct P1/P2 physical rear-paddle APF key signal was demonstrated.
