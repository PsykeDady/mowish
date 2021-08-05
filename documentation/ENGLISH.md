# MowiSH (English)
**M**ake **O**rder **WI**th ba**SH**   
With mowish, you can categorize your files by type in a folder. I.E. if you have a folder with images, audio and text file, executing mowish your directory will be reorganized into sub-folders each of which will contain only files of the same type.

Actually, mowish support: 

- Audio
- Pictures
- Documents (PDF)
- VIDEO
- text
- script
- archives
- executables
- disk images (ISO)
- DEB and RPM installation packages

The script is easily extendable
## installation

clone the repo: 
```bash
git clone https://github.com/PsykeDady/mowish
```

start installation script: 
```bash
./mowish/install.sh
```

Script can delete the cloned directory to, if you want to keep clean your system.
## uninstall 

You can use the uninstallation script: 

```bash
/usr/share/mowish/uninstall.sh
```

## how to use 

You can categorize the working directory by simple write: 

```bash
mowish
```

or specify a different working dir with: 
```bash
mowish path/to/dir
```

with `-d` or `--debug` flag script will be verbose ( for debugging )
```bash
movish -d path/to/dir
```

with `-r` or `--recursive` script will be recursive, every sub-folder will be reorganized.
with `-h` or `--help` you can see the help and then exit (no operation).
with `-e` or `--errors` you can see the error codes and then exit (no operation).