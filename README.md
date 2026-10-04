# VoiceOver for World of Warcraft

## VoiceOver on World of Warcraft: Forever

VoiceOver adds AI-voiced lines to quests and to NPC gossip. This fork makes it work on **World of Warcraft: Forever**. It works on Forever only. This fork does not support retail. Classic Era players should use the [original addon by MrThinger](https://github.com/mrthinger/wow-voiceover) instead.

It is two addons:

- **VoiceOver** (`AI_VoiceOver`) is the player. It plays the lines and shows a small window while they play.
- **VoiceOver Data - Vanilla** (`AI_VoiceOverData_Vanilla`) is the sound pack, about 1.1 GB. It holds the AI-generated voices for the original game's quests.

You can switch each one on and off in the game's AddOn list.

The voices are ready-made audio files that are already inside the sound pack. Nothing is generated while you play. You do not need a subscription, Python or an ElevenLabs account.

The CurseForge app cannot install the sound pack on Forever, because the CurseForge page is for Classic only. Use one of the two ways below instead.

This is a fork of the original work by [MrThinger](https://github.com/mrthinger/wow-voiceover). The fork only adds Forever support. The voices and the addon itself are his work.

### Install by hand

You need your Forever AddOns folder. It is here:

```
C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns
```

Windows may ask for administrator permission when you copy files into Program Files. Click Continue or Yes.

1. Download the player: [master.zip](https://github.com/Johan-p/wow-voiceover/archive/refs/heads/master.zip). Unpack it. Inside you will find a folder named `AI_VoiceOver`. Copy ONLY that inner `AI_VoiceOver` folder into the AddOns folder. Do not copy the whole download into AddOns.
2. Download the sound pack: [AI_VoiceOverData_Vanilla-v1.0.0.zip](https://github.com/mrthinger/wow-voiceover/releases/download/v1.3.1/AI_VoiceOverData_Vanilla-v1.0.0.zip) (1.1 GB). Unpack it into the AddOns folder. When it is done, the folder `AddOns\AI_VoiceOverData_Vanilla\` must exist.
3. Download one small file: [AI_VoiceOverData_Vanilla_Camelot.toc](https://raw.githubusercontent.com/Johan-p/wow-voiceover/master/AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc). Open the link, right-click the page, choose Save as, and save it into `AddOns\AI_VoiceOverData_Vanilla\`. Make sure the saved name is exactly `AI_VoiceOverData_Vanilla_Camelot.toc`, not `.txt`. Without this file Forever shows the sound pack as Incompatible.
4. Close the game completely and start it again. A new addon needs a full restart, not just `/reload`.
5. On the character select screen, open the AddOns list and tick both addons.

### Install with git (command line)

This is for players who have git installed. For Linux and macOS, see "Other systems" further down.

First, open Command Prompt or PowerShell as administrator. Either one works with the lines below. To do this, type "cmd" or "powershell" in the Start menu, right-click it and choose Run as administrator. To tell which window you have, look at the prompt. A PowerShell prompt starts with `PS`. Some lines start with `cmd /c`. That is because `mklink` is a Command Prompt command, and `cmd /c` lets PowerShell run it too. It does no harm in Command Prompt.

Then go to your AddOns folder with this line:

```
pushd "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns"
```

This line works in both windows. Your prompt must now end in `\Interface\AddOns`; if it does not, or an error appeared, stop, because the game is installed somewhere else, and put your own `...\_classic_beta_\Interface\AddOns` path between the quotes. Do not run the next lines until the prompt shows the AddOns folder.

Now run these five lines, one at a time, in this order:

```
git clone https://github.com/Johan-p/wow-voiceover.git wow-voiceover
cmd /c mklink /J AI_VoiceOver wow-voiceover\AI_VoiceOver
curl.exe -f -L -O https://github.com/mrthinger/wow-voiceover/releases/download/v1.3.1/AI_VoiceOverData_Vanilla-v1.0.0.zip
tar -xf AI_VoiceOverData_Vanilla-v1.0.0.zip
curl.exe -f -L -o AI_VoiceOverData_Vanilla\AI_VoiceOverData_Vanilla_Camelot.toc https://raw.githubusercontent.com/Johan-p/wow-voiceover/master/AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc
```

What they do:

1. The first line downloads the addon into a new folder called `wow-voiceover`. This copy is called a clone.
2. The second line makes a link called `AI_VoiceOver`. (The `cmd /c` at the start only lets PowerShell run it.) The addon sits one folder down inside the clone, and the game only loads folders that sit directly inside AddOns. The link makes the addon show up there, and it points back to the clone.
3. The third line downloads the sound pack (1.1 GB). The fourth line unpacks it into `AI_VoiceOverData_Vanilla`.
4. The fifth line downloads one small file into that folder. Without it Forever shows the sound pack as Incompatible.

If you installed by hand before, delete the old `AI_VoiceOver` folder first. Otherwise the second line fails.

Last, restart the game completely. A new addon needs a full restart, not just `/reload`. Then on the character select screen, open the AddOns list and tick both addons.

### Updating

If you installed with git: open Command Prompt or PowerShell as administrator, go to the AddOns folder, and pull the update. The prompt must end in `\Interface\AddOns`; if it does not, or an error appeared, stop and fix the path first. Then download the small file again, because it can change.

```
pushd "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns"
git -C wow-voiceover pull
curl.exe -f -L -o AI_VoiceOverData_Vanilla\AI_VoiceOverData_Vanilla_Camelot.toc https://raw.githubusercontent.com/Johan-p/wow-voiceover/master/AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc
```

Then type `/reload` in the game. If the update added a new file, restart the game instead.

If you installed by hand: download the repository zip again (the same master.zip as above). Then replace the `AI_VoiceOver` folder in AddOns with the new one. Download `AI_VoiceOverData_Vanilla_Camelot.toc` again from the link in step 3, because it can change.

### Removing

If you installed with git, run these two lines from the AddOns folder (the same window as above). Remove the link first, then the clone. The first line removes only the link. The second line deletes the clone.

```
cmd /c rmdir AI_VoiceOver
cmd /c rmdir /s /q wow-voiceover
```

Never run `rmdir /s` on `AI_VoiceOver` itself. It would delete the files in your clone. In PowerShell a plain `rmdir` is a different command, which is why these lines start with `cmd /c`.

If you also want the sound pack gone, delete the `AI_VoiceOverData_Vanilla` folder (it holds the extra TOC file too), and the zip file if you still have it.

If you installed by hand, delete the `AI_VoiceOver` folder in AddOns the normal way.

### Other systems (Linux, macOS)

The Windows commands above already work in PowerShell. In PowerShell, type `curl.exe`, not `curl`, because PowerShell has its own, different command called `curl`.

This part is for Linux and macOS. Your AddOns folder is the `AddOns` folder inside your Wine or Proton prefix. Where that is depends on how you run the game. On macOS, use the AddOns folder of your Forever install. Run everything below from that folder. Do the first block once, then the block for your system, in order. The update and remove lines come later.

```
git clone https://github.com/Johan-p/wow-voiceover.git wow-voiceover
ln -s -n wow-voiceover/AI_VoiceOver AI_VoiceOver
curl -f -L -O https://github.com/mrthinger/wow-voiceover/releases/download/v1.3.1/AI_VoiceOverData_Vanilla-v1.0.0.zip
```

Then unpack the sound pack and download the small file that stops Forever showing it as Incompatible. On Linux, GNU tar cannot unpack a zip file, so use unzip:

```
unzip AI_VoiceOverData_Vanilla-v1.0.0.zip
curl -f -L -o AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc https://raw.githubusercontent.com/Johan-p/wow-voiceover/master/AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc
```

On macOS, tar can unpack a zip file:

```
tar -xf AI_VoiceOverData_Vanilla-v1.0.0.zip
curl -f -L -o AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc https://raw.githubusercontent.com/Johan-p/wow-voiceover/master/AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc
```

To update, run these two lines. The small file can change, so download it again each time:

```
git -C wow-voiceover pull
curl -f -L -o AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc https://raw.githubusercontent.com/Johan-p/wow-voiceover/master/AI_VoiceOverData_Vanilla/AI_VoiceOverData_Vanilla_Camelot.toc
```

To remove the link, run the next line. Do not add a trailing slash to the name, and never use `rm -r` on it:

```
unlink AI_VoiceOver
```

### Known limitations

- Quests and NPCs that are new or changed in Forever have no recorded voice. They stay silent, without an error.
- There are no play buttons in the quest log.
- If you also use WIIIUI, VoiceOver's window may first appear on top of WIIIUI's console. Drag the window where you like. It remembers its place.
- To hide the minimap button, open VoiceOver's options with `/vo options` and untick "Show Minimap Button".
- If the sound pack shows as Incompatible (red), you missed the small `AI_VoiceOverData_Vanilla_Camelot.toc` step, or the file is not named exactly that or is not in `AddOns\AI_VoiceOverData_Vanilla\`, so do that step again and restart the game. Ticking "Load out of date AddOns" on the character select screen is only for the status Out of date.

---

## v2: https://allvoice.ai
Contribute voices on [allvoice.ai](https://allvoice.ai) so I can give each NPC a unique AI voicemodel to power their dialog. The top rated voice for each NPC will be used. 


### [voiceover discord](https://discord.gg/VdhUmA8ZCt)
### [allvoice code](https://github.com/allvoice/allvoice-website)

## Overview
- tts cli to create audio files for quests and gossip text.
- in game addon for playing generated voiceovers

- cli uses data fetched from a local MySQL database and ElevenLabs tts for speech


## Below is for developers only. Go to [releases](https://github.com/mrthinger/wow-voiceover/releases) if youre looking to install the addon.

## Requirements
- python 3.10+
- docker (for the database)

## Installation
1. Make a python virtual environment. (make sure to source it after creating)
```bash
python -m venv .venv
```
2. Install the required packages.
```bash
pip install -r requirements.txt
```
3. Copy the .env.example file to .env and fill in your ElevenLabs API Key and database credentials. The included database values are fine if you're going to use the docker-compose file.
```bash
cp .env.example .env
```
4. Start the MySQL DB
```bash
docker compose up -d
```
5. Seed the MySQL DB
```bash
python cli-main.py init-db
```

## Voice Setup
The generation scripts assume you have voices created in Elevenlabs named in the format `race-gender`. For the exact races the script checks your elevenlabs account for, refer to `tts_cli\consts.py`. Gender will always either be `male` or `female`. ex: `orc-male`. You will need to create your own voice clones. A good place to get samples is @ https://www.wowhead.com/sounds/npc-greetings/name:orc 
## Usage
To use the interactive CLI tool, run the following command:

```bash
python cli-main.py
```

### Language Client Selection
Currently there are no voice translations available for languages other than english. However, if you want to use the addon with a non English client, you can still do so by creating the lookup tables in the client's respective language.

To create the lookup tables, you can use the following command, with `LANGUAGE_CODE` representing the required language for the client:
```bash
python cli-main.py gen_lookup_tables --lang=LANGUAGE_CODE
```
The default selection, when no language code is provided, is English. Please be aware that the quality of text completion for translations in languages other than English can vary significantly.

The following language codes are supported:
| Language Code | Language |
| ------------- | ------- |
| enUS          | English |
| enGB          | English |
| koKR          | Korean |
| frFR          | French |
| deDE          | German |
| zhCN          | Simplified Chinese |
| zhTW          | Traditional Chinese |
| esES          | European Spanish |
| esMX          | Mexican Spanish |
| ruRU          | Russian |

## Output
The generated TTS audio files will be saved in the sounds folder, with separate subfolders for quests and gossip. Lookup tables and sound length tables will also be generated for use in the addon. 

## Addon Install
Copy over the `generated` folder to the VoiceOverData_Vanilla folder, then the VoiceOver and VoiceOverData_Vanilla folder to `World of Warcraft/_classic_era_/Interface/AddOns`. Alternatively, you can syslink instead of copying for faster development.
Example syslink:
```bash
export WOW_DIR=PATH_OF_YOUR_WOW_DIR
ln -s ./VoiceOver "$WOW_DIR/_classic_era_/Interface/AddOns"
ln -s ./VoiceOver_Vanilla "$WOW_DIR/_classic_era_/Interface/AddOns"
```
## Contributing
If you want to contribute to this project, please feel free to open an issue or submit a pull request.

# CLI Docs

## Dataframe Schema

The dataframe schema before calling the `preprocess_dataframe` function consists of the following columns:

| Column        | Description                                                  |
|---------------|--------------------------------------------------------------|
| `source`      | Indicates the type of interaction, can be 'accept', 'progress', 'complete', or 'gossip' |
| `quest`       | The quest ID or empty string if it's a gossip interaction    |
| `text`        | The text template content of the interaction                           |
| `DisplayRaceID` | The race ID of the NPC involved in the interaction          |
| `DisplaySexID`  | The gender ID of the NPC involved in the interaction        |
| `name`        | The name of the NPC involved in the interaction               |
| `type`        | The type of the NPC involved in the interaction ('creature', 'gameobject', or 'item') |
| `id`          | The creature/gameobject/item ID of the NPC involved in the interaction |

`DisplayRaceID = -1` is used for interactions with inanimate NPCs: gameobjects, items etc. It's mapped to a voice called "narrator" in `RACE_DICT`.

## New Fields Added by `preprocess_dataframe`

The `preprocess_dataframe` function adds the following new fields to the dataframe:

| Column                   | Description                                                  |
|--------------------------|--------------------------------------------------------------|
| `race`                   | The race of the NPC, mapped from `DisplayRaceID` using `RACE_DICT` |
| `gender`                 | The gender of the NPC, mapped from `DisplaySexID` using `GENDER_DICT` |
| `voice_name`             | The voice name, which is a combination of the race and gender fields |
| `templateText_race_gender` | A combination of the text, race, and gender fields          |
| `templateText_race_gender_hash` | A hash of the `templateText_race_gender` field          |
| `cleanedText` | `text` after rendering template |
