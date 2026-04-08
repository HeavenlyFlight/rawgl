#!/usr/bin/env bash

set -e

DIST="dist"
UCRT="/ucrt64/bin"

echo "Creating dist folder..."
rm -rf "$DIST"
mkdir -p "$DIST"

echo "Copying executable..."
cp rawgl.exe "$DIST/"

echo "Copying SDL2 core DLLs..."
cp SDL2.dll "$DIST/"
cp SDL2_mixer.dll "$DIST/"

echo "Copying audio codec DLLs..."
cp libogg-0.dll "$DIST/"
cp libvorbis-0.dll "$DIST/"
cp libvorbisfile-3.dll "$DIST/"
cp libvorbisenc-2.dll "$DIST/"
cp libmpg123-0.dll "$DIST/"

echo "Copying UCRT64 codec DLLs..."
cp "$UCRT/libFLAC.dll" "$DIST/"
cp "$UCRT/libopus-0.dll" "$DIST/"
cp "$UCRT/libopusfile-0.dll" "$DIST/"
cp "$UCRT/libwavpack-1.dll" "$DIST/"
cp "$UCRT/libxmp.dll" "$DIST/"

echo "Copying MinGW runtime..."
cp "$UCRT/libwinpthread-1.dll" "$DIST/"

echo "Done!"
echo "Your game is ready in: $DIST/"

