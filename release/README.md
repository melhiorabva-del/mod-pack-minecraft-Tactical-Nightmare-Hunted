Release instructions and helper script

What this folder contains
- This folder prepares a "release" archive structure you can zip and distribute.
- It DOES NOT contain mod .jar files (do not commit third-party jars to the repo without permission).

Goal
- Provide a repeatable package that contains:
  - the configs/ folder (already in repo)
  - a manifest.json (in repo root) describing the pack
  - a list of mods to download and a small helper script to build the release locally

How to build the release (on your machine)
1. Clone the repo and cd into it
2. Create a working directory and run the helper script to download mods (see notes)
   - The script will attempt to download mods only when direct download URLs are provided.
   - Many CurseForge downloads require account cookies or API tokens; the script includes placeholders.
3. After putting the mod .jar files into release/mods, run `./release/build_release.sh` to create release.zip

Files in this folder:
- mods_to_download.txt  -> list of mods and source hints (manual download recommended)
- build_release.sh      -> builds release.zip from release/ directory (requires zip)

Notes on legality and distribution
- Do NOT upload third-party mod jars to GitHub unless you have explicit permission from each mod author.
- Instead, provide the release as an installer/manifest that downloads jars from official sources (CurseForge/Modrinth) or instruct users how to download them.

If you want, I can:
- Attempt to fetch direct download URLs for mods that expose them publicly, or
- Create a MultiMC export that includes only the config + instructions and lets the user import mods manually.
