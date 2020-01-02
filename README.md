# `kerny`
<br/>
<br/>

`kerny` is an Intel x86 computer kernel bootloader.

## Credits & License

A project by [Joas Onvlee](https://github.com/joasonvlee).

This repository currently contains 512 bytes of bootsector code. Other files are used to switch to 32-bit Protected Mode and to print some messages to the screen. At the moment there is being worked on the kernel entry (and 64-bit Long Mode switch).
I added tons of comments to make the NASM Intel x86 code as understandable as possible. This is probbebly the most commented NASM x86 bootloader code that you will find out there, so make use of it :)

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/joasonvlee/kerny/blob/master/LICENSE)
