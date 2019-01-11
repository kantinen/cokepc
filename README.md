Kantinens `cokepc`-maskine
==============================

Alt indhold der bliver vist ligger i `content`-mappen.  Der er også mappen
`content-disabled`, men den er ikke vigtige for grundlæggende kørsel.

Dette er repoet for kantinens `cokepc`-maskine, den nuttede søskende til
`infoscreen`-maskinen.  Den kører softwaren
<https://github.com/datalogisk-kantineforening/kantinfo>.

Se også vores repo for kantinens `infoscreen`-maskine:
<https://github.com/datalogisk-kantineforening/cokepc>.

Maskinen har en opløsning på 1280x1024, så design efter det.


Bidrag!
-------

Vil du lægge noget på cokepc'en?  Det tager ikke så lang tid:

  1. Opret en bruger på GitHub.
  2. Fork dette repo til din egen bruger (der er en knap øverst i højre hjørne).
  3. Commit og push dine ændringer til din fork.  Accepterede filformater står
     beskrevet i <https://github.com/datalogisk-kantineforening/kantinfo>.
  4. Lav et pull request til cokepc-repoet med indholdet af din fork (der er
     en knap "New pull request" på denne side).


Opsætning
---------

`cokepc` køres på en Odroid, men en hvilken som helst datamat vil være okay.

`cokepc` er en Odroid som er monteret bag skærmen i kantinen.  Man kan logge ind
på maskinen ved at ssh'e til `odroid@diku.kantinen.org` og derfra ssh'e videre
til `cokepc` (eftersom K@ntinen har mere end én Odroid).  Kantinen skal have ens
offentlige nøgle før dette virker.  Løsenet på maskinen for `odroid`-brugeren er
bare `odroid`.  Hvis man vil automatisere denne loggen ind, kan man indtaste
følgende i filen `.ssh/config` på din egen maskine:

```
Host cokepc
  Hostname cokepc
  User odroid
  ProxyCommand ssh -W %h:%p odroid@diku.kantinen.org
```

Så kan man logge ind ved at køre `ssh cokepc`.

Når maskinen starter op, bliver brugeren `odroid` logget ind i en session, der
kører scriptet `.xsessionrc`.  Vi har vedhæftet vores `.xsessionrc` i dette
repo; se filen `xsessionrc` i `system`-mappen (den er symlinket på odroiden).

Dette scripts primære ansvar er at starte en `tmux`-session der kører
infoskærmsscriptet, samt starte en enkel window manager.  Hvis du vil tilføje
andre baggrundsprocesser og deslige, så start dem her.

Et cronjob (`sudo crontab -e`) sørger for at genstarte maskinen en gang om ugen.
Dette er for at sikre at der aldrig sniger sig noget ind i opsætningen der ikke
kan overleve en genstart.

Filen `/usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf` logger
brugeren odroid ind og slår skærmenstrømbesparingsmekanismen fra, hvis denne af
en grund skulle være blevet slået til.  Vi har vedhæftet filen i repoet i
`system`-mappen.


Afhængigheder
-------------

Vores `xsessionrc` afhænger af disse programmer:

  + `matchbox`: Simpel window manager
  + `xdotool`: Musemarkør-skjuler (mm.)
  + `tmux`: Ligesom screen, men fra BSD
