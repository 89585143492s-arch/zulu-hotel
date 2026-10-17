# Zulu Hotel Mobile for iPhone — test build 0.1.1

This repository contains build automation for the mobile application only.
Server source, configuration, player data and game-resource MUL files are excluded.
Editable Unity application source and the Xcode export are attached to the release.

The client connects to Zulu Hotel and downloads resources from the game website.
All standard containers use a resizable grid with continuous scrolling and no
pagination. The app includes the BF/FACE race paperdoll protocol and a draggable
Дверь button that sends .opendoor when tapped.

Unity 6000.0.32f1 exports this project locally on Windows. A standard macOS GitHub
runner compiles the export and packages an unsigned arm64 IPA. No Unity or Apple
account credentials are required by this workflow.

This is a test release. A successful compilation does not establish correct iPhone
runtime behavior. Device testing must cover login, resource download, graphics,
large containers, item dragging, race figures and door-button tap versus drag.
Each tester must sign the IPA with their own account before installation.

Based on MobileUO 1517c9c10a3765d1ba15ce5144e4bd41672173b2:
https://github.com/VoxelBoy/MobileUO
and ClassicUO 303c2ae699ca02caa6b09fbe5fbcb0c92f8bbd68.
ClassicUO source notices specify GPL version 3 or later; the GPLv3 text accompanies
the source archive. Existing third-party notices are retained.
