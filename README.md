Kantinens `cokepc`-maskine
==============================

Alt indhold der bliver vist ligger i `content`-mappen.  Der er også mappen
`content-disabled`, men den er ikke vigtige for grundlæggende kørsel.

Dette er repoet for kantinens `cokepc`-maskine, den nuttede søskende til
`infoscreen`-maskinen.  Den kører softwaren
<https://github.com/datalogisk-kantineforening/kantinfo>.

Se også vores repo for kantinens `infoscreen`-maskine:
<https://github.com/datalogisk-kantineforening/cokepc>.


Opsætning
---------

`cokepc` køres på en Odroid, men en hvilken som helst datamat vil være okay.

`cokepc` er en Odroid som er monteret bag skærmen i kantinen.  Man kan logge ind
på maskinen ved at ssh'e til `odroid@diku.kantinen.org` og derfra ssh'e videre
til `cokepc` (eftersom K@ntinen har mere end én Odroid).  Niels skal have ens
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
