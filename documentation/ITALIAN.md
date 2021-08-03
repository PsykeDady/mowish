# MowiSH
`Version: 0.1`
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

Lo script è facilmente estendibile
## Installazione

clona il repository: 
```bash
git clone https://github.com/PsykeDady/mowish
```

esegui lo script di installazione: 
```bash
./mowish/install.sh
```

Ti verrà chiesto se vuoi fare pulizia dei file di installazione.
## Disinstallazione

Puoi usare lo script di disinstallazione:

```bash
/usr/share/mowish/uninstall.sh
```

## Uso

Puoi fare ordine nella cartella corrente scrivendo semplicemente: 

```bash
mowish
```

o specificare un percorso scrivendo: 
```bash
mowish percorso/cartella
```

con il flag `-d` lo script stamperà ogni operazion ( utile per il debugging )
```bash
movish -d path/to/dir
```

con `-h` accederai al menu di help.
con `-e` puoi vedere tutti i codici di errore.