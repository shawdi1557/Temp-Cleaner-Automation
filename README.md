# Temp File Cleanup Automation

A simple Windows batch script that automatically clears out temporary files
from both the user `%temp%` folder and the system `C:\Windows\Temp` folder,
scheduled to run automatically via Windows Task Scheduler.

## What it does

- Deletes all files and subfolders inside `%temp%` (user temp folder)
- Deletes all files and subfolders inside `C:\Windows\Temp` (system temp folder)
- Skips any files currently in use/locked by running programs (no errors, just silently skipped)
- Deletes permanently — **does not** use the Recycle Bin

## Files

| File | Purpose |
|---|---|
| `Temp_Cleaner.bat` | The cleanup script itself |

## Requirements

- Windows 10 or 11
- No additional software or installation needed (uses built-in Command Prompt commands)
- Administrator rights required to fully clean `C:\Windows\Temp` (the `%temp%` portion works without admin rights)

## Manual usage

1. Copy the Script / Clone this repo and Save it as `Temp_Cleaner.bat`
2. Right-click the file → **Run as administrator** (needed to clean `C:\Windows\Temp` fully)
3. The window will close automatically when done (no output shown by default)

## Automating with Task Scheduler

1. Open **Task Scheduler** → **Create Task** (not "Create Basic Task")
2. **General tab**:
   - Name: `Temp File Cleanup`
   - Check **"Run with highest privileges"**
   - Configure for: **Windows 10**
3. **Triggers tab** → New:
   - Begin the task: **On a schedule**
   - Set frequency (e.g. Daily) and time
4. **Actions tab** → New:
   - Action: **Start a program**
   - Program/script: path to `clean_temp.bat` (e.g. `D:\Scripts\Teamp_Cleaner.bat`)
   - Start in (optional): the folder containing the script (e.g. `D:\Scripts`)
5. Click **OK** to save

## Notes

- "Run with highest privileges" in Task Scheduler is equivalent to "Run as administrator" — no need to set both.
- Files deleted by this script bypass the Recycle Bin entirely and are not recoverable.
- Safe to run while other programs are open; locked files are simply skipped.


