# VoiceOver for World of Warcraft

## VoiceOver on World of Warcraft: Forever

VoiceOver adds AI-voiced lines to quests and to NPC gossip. This fork makes it work on **World of Warcraft: Forever**. It works on Forever only. This fork does not support retail, and Classic Era players should use the [original addon by MrThinger](https://github.com/mrthinger/wow-voiceover) instead.

It is two addons:

- **VoiceOver** (`AI_VoiceOver`) is the player. It plays the lines and shows a small window while they play.
- **VoiceOver Data - Vanilla** (`AI_VoiceOverData_Vanilla`) is the sound pack, about 1.1 GB. It holds the AI-generated voices for the original game's quests.

You can switch each one on and off in the game's AddOn list.

The voices are ready-made audio files that are already inside the sound pack. Nothing is generated while you play. You do not need a subscription, Python or an ElevenLabs account.

This is a fork of the original work by [MrThinger](https://github.com/mrthinger/wow-voiceover). The fork only adds Forever support. The voices and the addon itself are his work.

### Install by hand

1. Open the [Releases page](https://github.com/Johan-p/wow-voiceover/releases) and download two zip files:
   * the player, `AI_VoiceOver-WoW_Forever-<version>.zip` (the version number changes with each release)
   * the sound pack, `AI_VoiceOverData_Vanilla-v1.0.0.zip` (about 1.1 GB)
2. Unpack both zips into your Forever AddOns folder:

   ```
   C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns
   ```

   Unpacking into Program Files may ask for administrator permission. You should end up with two folders: `AddOns\AI_VoiceOver\` and `AddOns\AI_VoiceOverData_Vanilla\`.
3. Start the game, or restart it if it was running. A new addon needs a full restart, not just `/reload`.
4. On the character select screen, open the AddOns list and make sure both addons are ticked.

### Install with git

For players who have git installed. You do not need the player zip, only the sound pack (see "Sound pack" below). Pick the block for your system and follow it from top to bottom.

The player addon sits one folder down inside the repository. So a plain `git clone` into AddOns will not load. Instead, you clone the repository anywhere you like, then link its `AI_VoiceOver` folder into AddOns.

Before you start:

- If you installed by hand before, delete the old `AddOns\AI_VoiceOver` folder first. Otherwise the link command fails on Windows, or creates a folder inside the old one on Linux and macOS.
- Run `git clone` in a normal window, not an administrator one. Open a Command Prompt or PowerShell as administrator only for the link command, and only if it says "Access denied". Creating a link under Program Files often needs that. If your normal account can write to the WoW folder, a normal window works for both.
- To remove the link later, never delete it recursively, and never add a trailing slash to its path. Either would delete the files in your clone. Each block below ends with the safe way.

#### Windows, Command Prompt

```
git clone https://github.com/Johan-p/wow-voiceover.git "%USERPROFILE%\wow-voiceover"
mklink /J "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns\AI_VoiceOver" "%USERPROFILE%\wow-voiceover\AI_VoiceOver"
```

Then start the game, or restart it if it was running, and tick both addons in the AddOns list. To remove the link later:

```
rmdir "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns\AI_VoiceOver"
```

#### Windows, PowerShell

```
git clone https://github.com/Johan-p/wow-voiceover.git "$env:USERPROFILE\wow-voiceover"
New-Item -ItemType Junction -Path "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns\AI_VoiceOver" -Target "$env:USERPROFILE\wow-voiceover\AI_VoiceOver"
```

Then start the game, or restart it if it was running, and tick both addons in the AddOns list. To remove the link later, call the Command Prompt's `rmdir`, because PowerShell's own `rmdir` is a different command:

```
cmd /c rmdir "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns\AI_VoiceOver"
```

If PowerShell asks whether to remove children, answer No.

#### Linux and macOS

On Linux the game usually runs through Wine, Proton or Lutris. So `<AddOns>` below means the `AddOns` folder inside your Wine or Proton prefix, the one at the end of the path `...\_classic_beta_\Interface\AddOns`. Where that is depends on how you run the game. Replace `<AddOns>` in every line with that folder.

```
git clone https://github.com/Johan-p/wow-voiceover.git ~/wow-voiceover
ln -s -n ~/wow-voiceover/AI_VoiceOver "<AddOns>/AI_VoiceOver"
```

Then start the game, or restart it if it was running, and tick both addons in the AddOns list. To remove the link later, use `unlink`, not `rmdir` (which refuses a link) and never `rm -r`:

```
unlink "<AddOns>/AI_VoiceOver"
```

The Battle.net launcher has been reported to remove folder links in some cases. If VoiceOver disappears from the AddOn list after a game update, run the link command again.

### Sound pack

The sound pack is a one-time download of about 1.1 GB. Git does not deliver the sound pack, because it is not part of the repository. So everyone installs it once, git users included.

You can download it by hand from the [Releases page](https://github.com/Johan-p/wow-voiceover/releases), as described in "Install by hand". Or use the commands below. Pick the block for your system. Each one opens a terminal in the AddOns folder and runs once. You should end up with `AddOns\AI_VoiceOverData_Vanilla\`.

#### Windows, Command Prompt

Under Program Files you may need a Command Prompt run as administrator for this. Windows 10 and later come with `curl.exe` and `tar`.

```
cd /d "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns"
curl.exe -L -O https://github.com/Johan-p/wow-voiceover/releases/latest/download/AI_VoiceOverData_Vanilla-v1.0.0.zip
tar -xf AI_VoiceOverData_Vanilla-v1.0.0.zip
```

#### Windows, PowerShell

Under Program Files you may need a PowerShell run as administrator for this. Windows 10 and later come with `curl.exe` and `tar`. Type `curl.exe`, not `curl`, because PowerShell's own `curl` is a different command.

```
cd "C:\Program Files (x86)\World of Warcraft\_classic_beta_\Interface\AddOns"
curl.exe -L -O https://github.com/Johan-p/wow-voiceover/releases/latest/download/AI_VoiceOverData_Vanilla-v1.0.0.zip
tar -xf AI_VoiceOverData_Vanilla-v1.0.0.zip
```

Or, with PowerShell's own commands instead of the last two lines:

```
Invoke-WebRequest -Uri https://github.com/Johan-p/wow-voiceover/releases/latest/download/AI_VoiceOverData_Vanilla-v1.0.0.zip -OutFile AI_VoiceOverData_Vanilla-v1.0.0.zip
Expand-Archive AI_VoiceOverData_Vanilla-v1.0.0.zip -DestinationPath .
```

#### Linux

Use the `AddOns` folder inside your Wine or Proton prefix (see "Install with git" above). The `tar` that comes with Linux cannot unpack a zip file, so use `unzip`. If `unzip` is missing, install it with your system's package manager first.

```
cd "<AddOns>"
curl -L -O https://github.com/Johan-p/wow-voiceover/releases/latest/download/AI_VoiceOverData_Vanilla-v1.0.0.zip
unzip AI_VoiceOverData_Vanilla-v1.0.0.zip
```

#### macOS

Use your Forever AddOns folder. On macOS, `tar` can unpack a zip file, so `tar -xf` works.

```
cd "<AddOns>"
curl -L -O https://github.com/Johan-p/wow-voiceover/releases/latest/download/AI_VoiceOverData_Vanilla-v1.0.0.zip
tar -xf AI_VoiceOverData_Vanilla-v1.0.0.zip
```

The CurseForge app cannot install this sound pack on Forever, because the CurseForge page is for Classic only. Install it from GitHub instead.

### Updating

**If you installed with git:** run the line for your system, then type `/reload` in the game. If the update added a new file, restart the game instead.

#### Windows, Command Prompt

```
git -C "%USERPROFILE%\wow-voiceover" pull
```

#### Windows, PowerShell

```
git -C "$env:USERPROFILE\wow-voiceover" pull
```

#### Linux and macOS

```
git -C ~/wow-voiceover pull
```

**If you installed by hand:** download the player zip again from the Releases page and replace the `AI_VoiceOver` folder with the new one.

### Known limitations

- Quests and NPCs that are new or changed in Forever have no recorded voice. They stay silent, without an error.
- There are no play buttons in the quest log.
- If you also use WIIIUI, VoiceOver's window may first appear on top of WIIIUI's console. Drag the window where you like. It remembers its place.
- The minimap button can be hidden. Open VoiceOver's options with `/vo options`, or go to Esc, Options, AddOns, VoiceOver, and untick "Show Minimap Button".
- If the sound pack shows as out of date in the AddOn list, tick "Load out of date AddOns" on the character select screen.

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
