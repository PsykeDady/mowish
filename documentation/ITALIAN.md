# MowiSH (Italian)
**M**ake **O**rder **WI**th ba**SH** (Fai ordine con bash)  
Con mowish puoi categorizzare i tuoi file in base al tipo.   
Ad esempio avendo una cartella con immagini, audio e file di testo semplice, eseguendo mowish la tua coartella verrà riorganizzata e categorizzata in sotto cartelle ognuna delle quali conterrà solo file dello stesso tipo.

Attualmente, mowish supporta: 

- Audio
- Immagini
- Documenti (PDF)
- VIDEO
- testi
- file di codice
- archivi
- eseguibili
- immagini disco (ISO)
- Pacchetti installazione DEB e RPM

Lo script è facilmente estendibile
## Installazione

### Automatica
clona il repository: 
```bash
git clone https://github.com/PsykeDady/mowish
```

esegui lo script di installazione: 
```bash
./mowish/install.sh
```

Ti verrà chiesto se vuoi fare pulizia dei file di installazione.

### Manuale
puoi installare il programma manualmente seguendo le seguenti istruzioni: 

1. copia la cartella di mowish in `/usr/share`: 
```bash 
sudo cp -r mowish /usr/share/mowish 
```
2. collega lo script nella cartella `/usr/bin`  
```bash
sudo ln -sf /usr/share/mowish/mowi.sh /usr/bin/mowish
```
3. installa l'estensione per il tuo gestore dei file

#### Servizio dolphin
Per il gestore dei file dolphin ( normalmente installato con plasma DE ) puoi seguire le seguenti istruzioni :   
```bash
printf "$(printf resources/mowish_dolphin.desktop)" "organizzaCartelle" "organizzaCartelle" "Organizza Cartelle" | sudo tee /usr/share/kservices5/mowish.desktop
```

Potrai quindi usare mowish dal menu azioni di dolphin (tasto destro su uno spazio vuoto &rarr; azioni &rarr; Organizza Cartelle)
#### Script nautilus

Per il gestore dei file nautilus (normalmente installato con Gnome DE) puoi seguire le seguenti istruzioni:

```bash 
mkdir -p $HOME/.local/share/nautilus/scripts

cp resource/mowish_nautilus.sh $HOME/.local/share/nautilus/scripts/"Organizza Cartelle"

chmod +x $HOME/.local/share/nautilus/scripts/"Organizza Cartelle"
```

Potrai quindi usare mowish dal menu script di nautilus (seleziona un file qualunque della cartella da organizzare &rarr; tasto destro &rarr; scripts &rarr; Organizza Cartelle. Facendo tasto destro su una cartella mowish agirà su di essa) 

##### **LIMITAZIONI DI NAUTILUS**

- Il menu script appare solo se si selezionano uno o più file. 
- lo script non viene installato per tutti gli utenti, ogni utente dovrà installare il suo

#### Azione nemo
Per il gestore dei file nemo (normalmente installato con Cinnamon DE) puoi seguire le seguenti istruzioni: 

```bash
printf "$(printf resources/mowish_nemo.nemo_action)" "Organizza Cartella" "Organizza Cartella" | sudo tee /usr/share/nemo/actions/mowish.nemo_action
```

Potrai quindi usare mowish dal menu contestuale di nemo (Tasto destro su uno spazio vuoto &rarr; Organizza cartella )

#### Contratto di pantheon (gestore file di elementary)
Per il gestore dei file di elementary (normalmente installato con Pantheon DE) puoi seguire le seguenti istruzioni: 

```bash
printf "$(printf resources/mowish_elementary.contract)" "Organizza Cartella" "Organizza Cartella" | sudo tee /usr/share/contractor/mowish.contract
```

Potrai quindi usare mowish dal menu contestuale del file manager di pantheon (Tasto destro su uno spazio vuoto &rarr; Organizza cartella )

#### Script Thunar

Per il gestore dei file Thunar (normalmente installato con XFCE DE) puoi seguire le seguenti istruzioni:

- se non esiste, crea la cartella `$HOME/.config/Thunar`
- se non esiste, crea il file `$HOME/.config/Thunar/uca.xml`
  - in caso aveste creato il file, scrivete al suo interno: 
```xml
<actions>
</actions>
```
- Prima dell'ultimo `</actions>` scrivere: 
```xml
<action>
	<icon>object-group</icon>
	<name>Organizza Cartella</name>
	<command>mowish %f</command>
	<description>Organizza Cartella</description>
	<patterns>*</patterns>
	<directories/>
</action>
```

Potrai quindi usare mowish dal menu contestuale di thunar.
##### **LIMITAZIONI DI NAUTILUS**

- Il menu script appare solo se si selezionano uno o più file. 
- lo script non viene installato per tutti gli utenti, ogni utente dovrà installare il suo


## Disinstallazione

### Automatica
Puoi usare lo script di disinstallazione:

```bash
/usr/share/mowish/uninstall.sh
```

### Manuale

cancella il collegamento simbolico di mowish in `/usr/bin` :
```bash
sudo rm /usr/bin/mowish
```

cancella la cartella mowish all'interno di `/usr/bin`
```bash
sudo rm -rf /usr/bin/mowish
```

cancella il file per il tuo gestore file se ne avevi installato uno.

#### Servizio dolphin
cancella il file di servizio dalla cartella `/usr/share/kservices5`: 

```bash
rm /usr/share/kservices5/mowish.desktop
```
#### Script nautilus
cancella lo script dalla cartella `$HOME/.local/share/nautilus/scripts`

```bash
rm $HOME/.local/share/nautilus/scripts/"Organizza Cartelle"
```

#### Azione nemo
cancella l'azione dalla cartella `/usr/share/nemo/actions` 

```bash
rm /usr/share/nemo/actions/mowish.nemo_action
```

#### Contratto elementary
cancella il contratto dalla cartella `/usr/share/contractor` 

```bash
rm /usr/share/contractor/mowish.contract
```

#### Azione thunar
Aprire il file 

## Uso

Puoi fare ordine nella cartella corrente scrivendo semplicemente: 

```bash
mowish
```

o specificare un percorso scrivendo: 
```bash
mowish percorso/cartella
```


### Opzioni

con il flag `-d` o `--debug` verranno stampate tutte le istruzioni ed i passaggi ( utile per il debug )
```bash
movish -d path/to/dir
```

con il flag `-r` o `--recursive` il software diventa ricorsivo, ogni sotto cartella verrà riorganizzata.
```bash
mowish -r path/to/dir
```

### Comandi per la stampa delle informazioni ( stampa ed esci )

con il flag `-h` o `--help` viene visualizzato questo menù di aiuto
con il flag `-e` o `--errors` viene visualizzata una lista di codici errore
con il flag `-v` o `--version` viene visualizzata la versione del programma