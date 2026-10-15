# Source and intellectual-property provenance

**Game and original hardware:** Tron © its respective rightsholders; original arcade product by Bally Midway, 1982; hardware platform Midway MCR-II.

**FPGA lineage:** This Pocket adaptation descends from the original MCR-II/Satan's Hollow HDL by **Dar** and a MiSTer MCR2 adaptation, with additional Pocket reference work by **HarpMudd** and other credited contributors. The upstream `README_orig.txt` attributes a T80 Z80-compatible CPU to Daniel Wallner, portions of memory/keyboard work to Peter Wendrich, and AY/YM-compatible audio to MikeJ. Consult the actual RTL headers for file-by-file copyright and notices. These original contributions **do not become the property of the Pocket port authors**.

**Pocket adaptation and new control mapping:** August and Doctor Lucy (ChatGPT), V02, 2026.

## Redistribution boundaries

The upstream MiSTer MCR-II project explicitly says that ROMs are not included and must be supplied separately. Its historical upstream README additionally contains strong 'Do not redistribute roms whatever the form' and 'Do not redistribute synthesized file with roms' notices. This project respects that limitation for any publicly shared repository/export.

**No game ROM is included in the GitHub-ready export.** The ROM-inclusive ZIP generated for the user's personal installation is kept on their own Mac and must not be uploaded to a public GitHub repository or release without rights clearance.

The inherited FPGA HDL includes distinct author notices. The upstream material does not have a single clearly applicable blanket license in the evidence reviewed. Do not add a new MIT/GPL/Apache license over all inherited files or change their copyright headers. The repository should be **private initially**, with a provenance/license review before public distribution of source and bitstreams.

Sources provided by the user for engineering reference included `Arcade-MCR2_MiSTer-master.zip` (README and README_orig.txt) and the HarpMudd-derived Pocket reference tree in the local T02 evidence. This file documents lineage, not an assertion that the authors possess a license to distribute all upstream files publicly.
