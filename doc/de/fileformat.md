# Fileformat

Die Erweiterung für Dateien ist ``beNerger``, bei 8.3 Dateisystemen ``beN``.
Alle Daten werden **little-endian** kodiert.

## Kurt Nerger

| Offset | Position | Beschreibung | Anmerkung |
|--------|-------|--------------|-----------|
|  0 |   4  | Magic Bytes| Erkennung des Dateityps beN über den Inhalt, immer hex:``4B 75 72 74`` |
|  4 |   1  | reserviert | Untertyp, zulässige Werte hex:``20`` |
|  5 |   8  | Länge der dekomprimierten Daten | **optional** 64 Bit Integer |
|  9 |  69  | reserviert | filler |
| 78 | EOF | Daten | 1..n Micro-Blockchains

*Jeder Micro-Blockchain ist mindestens 78 Bytes lang. Der Datenkopf ist an dieser optimalen Größe ausgerichtet.*

###### EOF
