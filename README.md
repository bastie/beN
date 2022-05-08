# beNerger teaser

beNerger (short beN) is a algorithm to compress data like Blockchain, called Micro-Blockchain. It is other - other than zlib or deflate, xz, rar etc.  

## Motivation

End of 2020, the local NAS is annoying again because the storage space is running out. Shit!
The RAID has been deactivated for almost a year and compression with [zlib](https://zlib.net), [zip](http://infozip.sourceforge.net), [7zip](https://www.7-zip.org) or [xz](https://tukaani.org/xz/) is no alternative. 

A new network storage is needed, **the last** network storage!

Eleven months later, a good dozen of proof of concepts, the beN algorithm is near. A modified blockchain algorithm, **Micro-Blockchain**, not designed to mine Bitcoin or other crypto currencies but to compress data. No algorithm for single-core or multi-core computers, **many-core** capable, state-of-the-art , GPU says hello!

## Technical overview
*beN* enables recursively an almost unlimited compression of any data stream. Based on established technologies such as modified blockchain, sorting and hash collisions calculation, lossy becomes lossless compression. The GPGPU and the parallel execution of hundreds and thousands of calculations allow an algorithm that would have taken an unacceptable amount of time just a few years ago. As a recursive algorithm, beN is also capable of streaming and allows you to compress and decompress a data stream from the beginning, even with highly compressed data, without knowing the entire data. Also tables as with [Huffman](https://en.wikipedia.org/wiki/Huffman_coding) based compressions are not needed.

> Note: a correct and specific designation of the algorithm is always fileformat algorithm like ``Kurt Nerger``

## Target compression rate 1% recursive

The target is a file type independent **1%** recursive compression rate. What did it mean, and what is the consequence?

- The consequense you have to understand is that the best compression is a combination of an established algorithm with beNerger.
- Also you can using beN with anything. Plain text, image, binary, music, database files - it doesnt matter.
- Important beNerger is recursive. Test with your favorite compression tool. At one point it cannot compress data in second or maybe third run to smaller output. Unlike beNerger.

### Theoretical compression rate of ``Kurt Nerger``

``Kurt Nerger`` has the maximum compression rate 78/80 equals 2.5% plus header size with 78 bytes (see fileformat). For 1 MB see table:


| recursive round | input size | output size | percent from first input |
| --------------- | ---------- | ----------- | --------------------- |
| 1 | 1073741824 | 1046898280 | 97.50 % |
| 2 | 1046898280 | 1020725824 | 95.06 % |
| 3 | 1020725824 |  995207680 | 92.69 % |
| 4 |  995207680 |  970327488 | 90.37 % |
| 5 |  970327488 |  946069302 | 88.11 % |

**Calculation**

*The size of an uncompressed Micro-Blockchain is 80 bytes.*

1. Input 1073741824 bytes modulo 80 equals 64 bytes
2. Input (1073741824 bytes - 64 bytes) / 80 bytes = 13421772 Micro-Blockchain
3. Output Micro-Blockchains 13421772 * 78 bytes = 1046898216 bytes
4. Output 1046898216 bytes + 64 bytes = 1046898280 bytes without header
5. *If only one round add header size: 78 bytes + 1046898280 bytes = 1046898358 bytes*

## Changelog

 * 1989-11-09
   * The Peaceful Revolution open the gate
 * 1990-07-01
   * The Deutsche Mark come to us and two things were bought a Stereo-Doppeldeck-Kassettenrecorder like ghetto blaster for the poor and a C64 and later Amiga 500+ and with [Power Packer](https://github.com/lab313ru/powerpacker_src) a new field for mind discovered
 * 1998-09-15
   * Some ideas for loseless compression existed but never implemented or tested but to slow 
 * 2020-10-03
   * or near this date our local NAS is full
 * 2020-11-01
   * switched Project 2021 to compression rethinking
 * 2021-09-05
   * more or less, second PoC work but is fast enough and called beNerger
 * 2022-04-01
   * Part 1 of public review started with post on [LinkedIn](https://www.linkedin.com/embed/feed/update/urn:li:share:6915703205381160961) and to [Hutter Prize discussion group](https://groups.google.com/g/hutter-prize)
 * 2022-04-02
   * Extended Part 1 posted on [Github](https://github.com/bastie/beN)
 * 2022-05-05
   * Prerelease with compression but needing manually cli input
 * 2022-??-??
   * beNerger -c <file> creates self <file>.beN output, filename test.beN removed 
   * beNerger -c save uncompressed file size as UInt64
   * beNerger -c save correct skip value in header
