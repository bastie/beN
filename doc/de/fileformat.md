# Fileformat

Die Erweiterung für Dateien ist ``beNerger``, bei 8.3 Dateisystemen ``beN``.
Alle Daten werden **little-endian** kodiert.

## Kurt Nerger

| Offset | Länge | Beschreibung | Anmerkung |
|--------|-------|--------------|-----------|
|  0 |   4 | Magic Bytes| Erkennung des Dateityps beN über den Inhalt, immer hex:``4B 75 72 74`` |
|  4 |   1 | reserviert | Untertyp, zulässige Werte hex:``20`` |
|  5 |   4 | Runden | Anzahl der rekursiven Schleifen als 32 Bit Integer |
|  9 |   8 | Länge der dekomprimierten Daten | vorzeichenloser 64 Bit Integer |
| 17 |  60 | reserviert | filler |
| 77 |   1 | Sprung-Wert | vorzeichenloser 8 Bit Integer |
| 78 | EOF | Daten | 1..n Micro-Blockchains |

*Jeder Micro-Blockchain ist mindestens 78 Bytes lang. Der Datenkopf ist an dieser optimalen Größe ausgerichtet.*


### Micro-Blockchain (komprimiert)
| Offset | Länge | Description | Notes |
|--------|-------|--------------|-----------|
|  0 |   5 | Reparaturinformationen | it's magic |
|  5 |   8 | Block 0 | unverändert |
| 14 |   6 | Block 1 | verändert |
| 20 |   1 | more magic | ... |
| … | … | … | … |
| 69 |   8 | Block 9 | unverändert |
| 77 |   1 | Sprung-Wert | vorzeichenloser 8 bit Integer |

### Micro-Blockchain (unverändert)
| Offset | Länge | Description | Notes |
|--------|-------|--------------|-----------|
|  0 |   80 | BLOB | large ist etwas übertrieben |


###### EOF
