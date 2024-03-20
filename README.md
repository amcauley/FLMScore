# FLMScore
Plugins to edit FL Studio piano rolls using MuseScore

# Intro
FLMScore is a set of plugins that helps link MuseScore to FL Studio. Specifically, it provides a MuseScore 4.x plugin that exports sheet music notes that a corresponding FL Studio piano roll plugin reads. The goal is to use Muse Score's sheet music GUI to create melodies, chords, etc. that you can instantly import into FL Studio (which lacks a sheet music editing GUI).

# Installation
1. Copy the FL Studio script from this project (`FLStudio/FLMScore.pyscript`) into your local FL Studio `Piano roll scripts` directory (create it if it doesn't already exist), ex. `Z:\YourLocalProgramsPath\FL Studio BETA\System\Config\Piano roll scripts\FLMScore.pyscript`.
2. Copy the MuseScore plugin from this project (`MuseScore/FLMScore/FLMScore.qml`) into your local MuseScore installation in a `FLMScore` sub-directory, ex. the final location might look like: `Z:\YourLocalDocumentsPath\MuseScore4\Plugins\FLMScore\FLMScore.qml`.
3. Modify the contents of `FLMScore.qml` so that the FileIO source points to the FL Studio script directory. Look for the line that begins with "UPDATE THE FOLLOWING PATH".
4. The next time you open up MuseScore, go to the Plugins tab, select FLMScore, and enable it.

# Usage
1. Open up a MuseScore score and create whatever notes you want. You can use multiple staves and voices, although some notation such as grace notes and tied notes isn't supported.
2. Open up FL Studio and open the piano roll for the pattern / instrument you want to modify.
3. In MuseScore, run FLMScore from the plugin dropdown menu.
4. In FL Studio, run the FLMScore script from the piano roll's Tools -> Scripts menu. If you've already run it, you can quickly re-run it by pressing `Ctrl + Alt + Y`.
5. Make any additional updates you like and repeat steps 3 and 4 to transfer the changes.

# Limitations
1. I haven't found a good way to enable live updates yet, i.e. constantly checking for updates and exporting/importing them automatically. MuseScore's event listeners and timers don't seem to be behaving yet in version 4.x, and FL Studio's GUI freezes if I try to introduce a polling loop.
2. The MuseScore plugin is only handling basic notation. No dynamics, no note slurring, no articulations, etc.
