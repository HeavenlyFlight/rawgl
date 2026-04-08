
# raw(gl) - Another World Interpreter

rawgl is a re-implementation of the engine used in the game Another World.

## Building for Windows

 - Install MSYS2 https://www.msys2.org/
 - Open MSYS2 MinGW UCRT64 (important)
 ```
pacman -Syu
pacman -S --needed \
    mingw-w64-ucrt-x86_64-gcc \
    mingw-w64-ucrt-x86_64-cmake \
    mingw-w64-ucrt-x86_64-make \
    mingw-w64-ucrt-x86_64-SDL2 \
    mingw-w64-ucrt-x86_64-SDL2_mixer \
    mingw-w64-ucrt-x86_64-libogg \
    mingw-w64-ucrt-x86_64-libvorbis \
    mingw-w64-ucrt-x86_64-mpg123 \
    mingw-w64-ucrt-x86_64-opusfile \
    mingw-w64-ucrt-x86_64-flac \
    mingw-w64-ucrt-x86_64-wavpack \
    mingw-w64-ucrt-x86_64-libxmp
```
 - Build MT32Emu (static)
 ```
 cd munt/mt32emu
rm -rf build
mkdir build
cd build

cmake -G "Unix Makefiles" \
  -DCMAKE_INSTALL_PREFIX=/ucrt64 \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_C_COMPILER=/ucrt64/bin/gcc \
  -DCMAKE_CXX_COMPILER=/ucrt64/bin/g++ \
  ..

make -j0
make install
```
 - Build RawGl
 ```
cd ~/rawgl
make clean
make
```
 - Run build_dist.sh (this copies the exe and dll to a /dist folder)
 ```
 chmod +x build_dist.sh
./build_dist.sh
```
 - Añade los assets
#

![Screenshot Intro Amiga](docs/screenshot-intro-amiga.png) ![Screenshot Intro 3DO](docs/screenshot-intro-3do.png)

## Supported Versions

The program requires the original data files.

- Amiga (Bank*)
- Atari (Bank*)
- Atari demo (AW.TOS)
- DOS (Bank*, memlist.bin)
- DOS demo (Demo*, memlist.bin)
- 15th Anniversary Edition (Data/Pak01.pak, Menu/, Music/)
- 20th Anniversary Edition (game/)
- Windows 3.1 (Bank, *mid)
- 3DO (GameData/ or .ISO)
- Macintosh (.rsrc, data/)

## Running

By default, the engine tries to load the game data files from the current
directory. This can be changed with command line switches.

```
  Usage: rawgl [OPTIONS]...
    --datapath=PATH   Path to data files (default '.')
    --language=LANG   Language (fr,us,de,es,it)
    --part=NUM        Game part to start from (0-35 or 16001-16009)
    --render=NAME     Renderer (original,software,gl)
    --window=WxH      Windowed display size (default '640x400')
    --fullscreen      Fullscreen display (stretched)
    --fullscreen-ar   Fullscreen display (16:10 aspect ratio)
    --ega-palette     Use EGA palette with DOS version
    --demo3-joy       Use inputs from 'demo3.joy' (DOS demo)
    --difficulty=DIFF Difficulty (easy,normal,hard)
    --audio=AUDIO     Audio (original,remastered)
    --mt32            Use MT32 sounds mapping with DOS version
```

In game hotkeys :

```
  Arrow Keys      move Lester
  Enter/Space     run/shoot
  C               enter a code to start at a specific position
  P               pause the game
  Alt X           exit the game
```

## Technical Details

- [Amiga/DOS](docs/Amiga_DOS.md)
- [3DO](docs/3DO.md)
- [WiiU](docs/WiiU.md)
