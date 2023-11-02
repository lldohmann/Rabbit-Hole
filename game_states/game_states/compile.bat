REM Automatically generated from Makefile
mkdir -p obj
..\..\..\bin\lcc   -c -o obj\main.o src\main.c
..\..\..\bin\lcc   -c -o obj\common.o res\common.c
..\..\..\bin\lcc   -c -o obj\GameFirstLoad.o res\GameFirstLoad.c
..\..\..\bin\lcc   -c -o obj\GameplayStart.o res\GameplayStart.c
..\..\..\bin\lcc   -c -o obj\CoreGameLoop.o res\CoreGameLoop.c
..\..\..\bin\lcc   -c -o obj\GameplayEnd.o res\GameplayEnd.c
..\..\..\bin\lcc   -o obj\Example.gb obj\main.o obj\common.o obj\GameFirstLoad.o  obj\GameplayStart.o obj\CoreGameLoop.o obj\GameplayEnd.o
