@echo off
start "" "C:\SoundKeeper\SoundKeeper64.exe"
cd /d C:\Garzanti
start "" /wait Garzanti_it.exe
taskkill /f /im SoundKeeper64.exe