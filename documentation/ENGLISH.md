# MowiSH (English)
**M**ake **O**rder **WI**th ba**SH**  
With mowish, you can categorize your files by type in a folder.  
I.E. if you have a folder with images, audio and text file, executing mowish your directory will be reorganized into sub-folders each of which will contain only files of the same type.

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

### Automatic (recommended)
Clone the repo: 
```bash
git clone https://github.com/PsykeDady/mowish
```

start installation script: 
```bash
./mowish/install.sh
```

Script can delete the cloned directory to, if you want to keep clean your system.

### Manual
You can install manually the script by executing these istruction:

1. copy mowish directory under `/usr/share`: 
```bash 
sudo cp -r mowish /usr/share/mowish 
```
2. link mowish script to `/usr/bin` directory  
```bash
sudo ln -sf /usr/share/mowish/mowi.sh /usr/bin/mowish
```
3. install extension for your file manager

### Dolphin service
If you have dolphin file manager (usually from plasma DE) to install service you can write:  
```bash
printf "$(cat resources/mowish_dolphin.desktop)" "organizeDirectory" "organizeDirectory" "Organize Directory" | sudo tee /usr/share/kservices5/mowish.desktop
```

You can now use `mowish` from actions context menu of `dolphin` (right click on empty space &rarr; actions &rarr; Organize Directory )
#### Nautilus script 

If you have nautilus file manager ( usually from Gnome DE ) to install script you can write: 

```bash 
mkdir -p $HOME/.local/share/nautilus/scripts

cp resource/mowish_nautilus.sh $HOME/.local/share/nautilus/scripts/"Organize Directory"

chmod +x $HOME/.local/share/nautilus/scripts/"Organize Directory"
```

You can now use `mowish` from script context menu of `nautilus` (select random file from directory &rarr; right click &rarr; scripts &rarr; Organize Directory. You can also run with right click on directory to order) 

##### **NAUTILUS LIMITATIONS**

- script menu will appear only if you click with right button on file (or files' selection). 
- script is not global installable, every user have to install script in their own directory
#### Nemo action
If you have nemo file manager (usually from Cinnamon DE) to install script you can write: 

```bash
printf "$(cat resources/mowish_nemo.nemo_action)" "Organize Directory" "Organize Directory" | tee /usr/share/nemo/actions/mowish.nemo_action
```

You can now use `mowish` from context menu of `nemo` (right click on empty space &rarr; Organize Directory )

#### Pantheon contract (elementary file manager)
If you have elementary file manager (usually from Pantheon DE) to install script you can write: 

```bash
printf "$(printf resources/mowish_elementary.contract)" "Organizza Cartella" "Organizza Cartella" | sudo tee /usr/share/contractor/mowish.contract
```

You can now use `mowish` from context menu of `pantheon` file manager (right click on empty space &rarr; Organize Directory )

#### Thunar action

If you have thunar file manager (usually from XFCE DE) to install script you can follow this steps: 

- if not exists, create directory `$HOME/.config/Thunar`
- if not exists, create file `$HOME/.config/Thunar/uca.xml`
  - in that case, you can write inside the file: 
```xml
<actions>
</actions>
```
- Before `</actions>` write this: 
```xml
<action>
	<icon>object-group</icon>
	<name>Organize Directory</name>
	<command>mowish %f</command>
	<description>Organize Directory</description>
	<patterns>*</patterns>
	<directories/>
</action>
```

You can now use `mowish` from context menu of `thunar` file manager (right click on empty space &rarr; Organize Directory )
##### **THUNAR limitation**

- lo script non viene installato per tutti gli utenti, ogni utente dovrà installare il suo

## uninstall 

### Automatic (recommended)
You can use the uninstallation script: 

```bash
/usr/share/mowish/uninstall.sh
```

### manual 

Delete mowish symbolic link in `/usr/bin` directory:
```bash
sudo rm /usr/bin/mowish
```

Delete mowish directory under `/usr/bin`
```bash
sudo rm -rf /usr/bin/mowish
```

Delete file for your file manager if you had installed one.

#### Dolphin service
Remove service file from `/usr/share/kservices5`: 

```bash
sudo /usr/share/kservices5/mowish.desktop
```
#### Nautilus script
Remove script from `$HOME/.local/share/nautilus/scripts`

```bash
rm $HOME/.local/share/nautilus/scripts/"Organize Directory"
```

#### Nemo actions
Remove action from `/usr/share/nemo/actions` 

```bash
sudo /usr/share/nemo/actions/mowish.nemo_action
```

#### Elementary contract
Delete elementary contract from `/usr/share/contractor` directory 

```bash
sudo /usr/share/contractor/mowish.contract
```

#### Thunar action
Open `$HOME/.config/Thunar/uca.xml` file and delete these lines:  

```xml
<action>
	<icon>object-group</icon>
	<name>Organize Directory</name>
	<command>mowish %f</command>
	<description>Organize Directory</description>
	<patterns>*</patterns>
	<directories/>
</action>
```

## How to use 

You can categorize the working directory by simple write: 

```bash
mowish
```

or specify a different directory with: 
```bash
mowish path/to/dir
```

### Options

With `-d` or `--debug` flag script will be verbose ( for debugging )
```bash
movish -d path/to/dir
```

With `-r` or `--recursive` script will be recursive, every sub-folder will be reorganized.
```bash
mowish -r path/to/dir
```

### Print info Commands ( print and exit )

With `-h` or `--help` you can see the help and then exit (no operation).
With `-e` or `--errors` you can see the error codes and then exit (no operation).
With `-v` or `--version` software version will be print 