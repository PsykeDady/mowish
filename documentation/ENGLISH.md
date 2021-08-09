# MowiSH (English)
**M**ake **O**rder **WI**th ba**SH**   
With mowish, you can categorize your files by type in a folder. I.E. if you have a folder with images, audio and text file, executing mowish your directory will be reorganized into sub-folders each of which will contain only files of the same type.

Actually, mowish supports: 

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

### automatic
clone the repo: 
```bash
git clone https://github.com/PsykeDady/mowish
```

start installation script: 
```bash
./mowish/install.sh
```

Script can delete the cloned directory to, if you want to keep clean your system.

### manual
you can install manually the script by executing these istruction:

1. copy mowish directory under `/usr/share`: 
```bash 
sudo cp -r mowish /usr/share/mowish 
```
2. link mowish script to `/usr/bin` directory  
```bash
sudo ln -sf /usr/share/mowish/mowi.sh /usr/bin/mowish
```
3. install extension for your file manager

### dolphin service
If you have dolphin file manager ( usually from plasma DE) to install service you can write:   
```bash
printf "$(cat resources/mowish_dolphin.desktop)" "organizeDirectory" "organizeDirectory" "Organize Directory" | sudo tee /usr/share/kservices5/mowish.desktop
```

You can now use mowish from actions context menu of dolphin (right click on empty space &rarr; actions &rarr; Organize Directory )
#### nautilus script 

If you have nautilus file manager ( usually from Gnome DE ) to install script you can write: 

```bash 
mkdir -p $HOME/.local/share/nautilus/scripts

cp resource/mowish_nautilus.sh $HOME/.local/share/nautilus/scripts/"Organize Directory"

chmod +x $HOME/.local/share/nautilus/scripts/"Organize Directory"
```

You can now use mowish from script context menu of nautilus (select random file from directory &rarr; right click &rarr; scripts &rarr; Organize Directory. You can also run with right click on directory to order) 

##### **NAUTILUS LIMITATIONS**

- script menu will appear only if you click with right button on file. 
- script is not global installable, every user have to install script in their own directory
#### nemo action
If you have nemo file manager (usually from Cinnamon DE) to install script you can write: 

```bash
printf "$(cat resources/mowish_nemo.nemo_action)" "Organize Directory" "Organize Directory" | tee $HOME/.local/share/nemo/actions/mowish.nemo_action
```

You can now use mowish from context menu of nemo (right click on empty space &rarr; Organize Directory )
## uninstall 

### automatic
You can use the uninstallation script: 

```bash
/usr/share/mowish/uninstall.sh
```

### manual 

delete mowish symbolic link in `/usr/bin` directory:
```bash
sudo rm /usr/bin/mowish
```

delete mowish directory under `/usr/bin`
```bash
sudo rm -rf /usr/bin/mowish
```

delete file for your file manager if you had installed one.

#### dolphin service
remove service file from `$HOME/.local/share/kservices5`: 

```bash
rm $HOME/.local/share/kservices5/mowish.desktop
```
#### nautilus script
remove script from `$HOME/.local/share/nautilus/scripts`

```bash
rm $HOME/.local/share/nautilus/scripts/"Organize Directory"
```

#### nemo actions
remove action from `$HOME/.local/share/nemo/actions` 

```bash
rm $HOME/.local/share/nemo/actions/mowish.nemo_action
```

## how to use 

You can categorize the working directory by simple write: 

```bash
mowish
```

or specify a different directory with: 
```bash
mowish path/to/dir
```

### Options

with `-d` or `--debug` flag script will be verbose ( for debugging )
```bash
movish -d path/to/dir
```

with `-r` or `--recursive` script will be recursive, every sub-folder will be reorganized.
```bash
mowish -r path/to/dir
```

### Print info Commands ( print and exit )

with `-h` or `--help` you can see the help and then exit (no operation).
with `-e` or `--errors` you can see the error codes and then exit (no operation).
with `-v` or `--version` software version will be print 