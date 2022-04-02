# Fileformat

The file extension is ``beNerger``, on 8.3 file systems ``beN``.
All data decoded in **little-endian**.

## Kurt Nerger

| Offset | Position | Description | Notes |
|--------|-------|--------------|-----------|
|  0 |   4  | magic bytes| detection [file](http://www.darwinsys.com/file/) type with this bytes, always hex:``4B 75 72 74`` |
|  4 |   1  | reserved | subtyp, allowed values are hex:``20`` |
|  5 |   8  | size of decompressed data | **optional** 64 bit integer |
|  9 |  69  | reserved | filler |
| 78 | EOF | data | 1..n Micro-Blockchains

*Every Micro-Blockchain contains min 78 bytes. The data header is aligned on this size.*

###### EOF
