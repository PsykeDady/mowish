# MowiSH
`Version: 0.1`
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

with `-d` flag script will be verbose ( for debugging )
```bash
movish -d path/to/dir
```

with `-h` you can see the help
with `-e` you can see the error codes.