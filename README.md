# Dizionario-Garzanti-di-Italiano-2006-CD-ROM-on-Windows-11
## How to install the audio of the CD-ROM on Windows 11

This is a CD-ROM basically for the Windows XP Pro Service Pack 3 or so, it will install fine on Windows 11 but it won't have audio, that is, the pronounciation of the words.

The audio is compressed into the ita_audio.waves file, using the Sipro Lab ACELP.net codec.

**Steps:**

1. You need these two files from XP Pro folder `C:\WINDOWS\system32` (included here for download):
* `acelpdec.ax` (this is the key one)
* `sl_anet.acm` (this is just a backup)

2. On Windows 11, place both files into the **`C:\Windows\SysWOW64`** folder.

3. Open an **Administrator** Command Prompt and register the decoder using the 32-bit `regsvr32`:
```cmd
C:\Windows\SysWOW64\regsvr32.exe C:\Windows\SysWOW64\acelpdec.ax

```

If successful, a "DllRegisterServer ... succeeded" message will appear.

4. This step is optional but recommended: also register the ACM version. In the same Administrator Command Prompt:
```cmd
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Drivers32" /v msacm.sl_anet /t REG_SZ /d sl_anet.acm /f

```

5. Restart the dictionary and test the playback.

If it still doesn't play sound, clear the DirectShow filter cache, as the old list might still remain:

```cmd
reg delete "HKCU\Software\Microsoft\Multimedia\ActiveMovie\Filter Cache" /f

```

Then restart the dictionary.

-----------------------------------------------------------------------------------
If you use bluetooth ear buds, the sound is delayed. With SoundKeeper you can eliminate this delay. You can download it from here:
https://github.com/vrubleg/soundkeeper

Then use the Garzanti.bat file to open SoundKeeper while you open the dictionary, and close it while you close the dictionary. The folders in the batch file are:

C:\SoundKeeper\SoundKeeper64.exe

C:\Garzanti - the folder of the installed dictionary

Change the folders in the batch file as you used them.

```cmd
@echo off
start "" "C:\SoundKeeper\SoundKeeper64.exe"
cd /d C:\Garzanti
start "" /wait Garzanti_it.exe
taskkill /f /im SoundKeeper64.exe
```

Then create a desktop shortcut for the batch file which calls the cmd.exe to be able to pin it on the system tray with the target:
```
C:\Windows\System32\cmd.exe /c "C:\Garzanti\Garzanti.bat"
```
Change the icon to the one from (or wherever your dictionary installation has the .exe file):
```
%SystemDrive%\Garzanti\Garzanti_it.exe 
```
Set the run to Minimized and use it.




