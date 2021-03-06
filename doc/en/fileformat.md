# Fileformat

The file extension is ``beNerger``, on 8.3 file systems ``beN``.
All data decoded in **little-endian**.

## Kurt Nerger

### header

| Offset | Position | Description | Notes |
|--------|-------|--------------|-----------|
|  0 |   4 | magic bytes| detection [file](http://www.darwinsys.com/file/) type with this bytes, always hex:``4B 75 72 74`` |
|  4 |   1 | reserved | subtyp, allowed values are hex: ``20`` |
|  5 |   4 | rounds | counts of recursive loop as 32 bit integer |
|  9 |  17 | size of decompressed data | unsigned 64 bit integer |
| 17 |  60 | reserved | filler |
| 77 |   1 | skip count | unsigned 8 bit integer |
| 78 | EOF | data | 1..n Micro-Blockchains |

*Every Micro-Blockchain contains min 78 bytes. The data header is aligned on this size.*

### micro blockchain (compressed)
| Offset | Length | Description | Notes |
|--------|--------|-------------|-----------|
|  0 |   5 | repair informations | it's magic |
|  5 |   8 | block 0 | unchanged |
| 14 |   6 | block 1 | changed |
| 20 |   1 | more magic | ... |
| … | … | … | … |
| 69 |   8 | block 9 | unchanged |
| 77 |   1 | skip count | unsigned 8 bit integer |

### micro blockchain (unchanged)
| Offset | Length | Description | Notes |
|--------|--------|-------------|-----------|
|  0 |   80 | BLOB | are 80 bytes large? |



###### EOF
