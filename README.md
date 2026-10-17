# Zulu Hotel Mobile — iPhone build

This repository contains only the build automation for the mobile application.
Game-server source, settings, account data and game resource MUL files are not
included. The exported Xcode application and editable Unity sources are provided
as release assets.

## Current status

The base Unity project compiles and exports successfully on Windows with
Unity 6000.0.32f1 and iOS Build Support. It includes the Zulu Hotel connection
and the resource ZIP downloader with a 104-file manifest. The scrollable
containers, race paperdoll protocol and door button still need to be ported
from the Android build. This is not a feature-complete iPhone release.

Run **Actions → Compile exported iOS project → Run workflow** to compile the
prepared Xcode project on a standard macOS runner and create an unsigned IPA.
Successful Unity export does not establish that Xcode compilation or device
installation will succeed. Test the resulting IPA on an iPhone before release.

Each tester signs the unsigned IPA with their own account using a sideloading
installation tool. No Apple account, Unity password or game-server secret is
required by this workflow.

Based on MobileUO commit 1517c9c10a3765d1ba15ce5144e4bd41672173b2:
https://github.com/VoxelBoy/MobileUO . ClassicUO dependency:
303c2ae699ca02caa6b09fbe5fbcb0c92f8bbd68. See the editable Unity source release
asset for the app sources and license notices. No game resource files are bundled.
