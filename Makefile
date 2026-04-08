# -----------------------------
#  RAWGL - Windows (MSYS2 UCRT64)
# -----------------------------

SRCS = aifcplayer.cpp bitmap.cpp file.cpp engine.cpp graphics_soft.cpp \
       script.cpp mixer.cpp pak.cpp resource.cpp resource_mac.cpp resource_nth.cpp \
       resource_win31.cpp resource_3do.cpp scaler.cpp screenshot.cpp systemstub_sdl.cpp \
       sfxplayer.cpp staticres.cpp unpack.cpp util.cpp video.cpp main.cpp

# SDL2 flags
SDL_CFLAGS = $(shell sdl2-config --cflags)
SDL_LIBS   = $(shell sdl2-config --libs) -lSDL2_mixer

# Enable OpenGL on Windows
ifndef NO_GL
	SRCS += graphics_gl.cpp
	SDL_LIBS += -lopengl32
	DEFINES += -DUSE_GL
endif

# MT32Emu support
ifndef NO_MT32EMU
	DEFINES += -DUSE_MT32EMU
	LIBS += -lmt32emu
endif

# Optional ADLMIDI
ifdef USE_LIBADLMIDI
	DEFINES += -DUSE_LIBADLMIDI
	LIBS += -lADLMIDI
endif

# Compiler flags
CXXFLAGS := -g -O2 -MMD -Wall -Wpedantic $(SDL_CFLAGS) $(DEFINES)
CXXFLAGS += -static-libgcc -static-libstdc++


# Linker flags
LIBS += -lz

OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.d)

# -----------------------------
#  Build target
# -----------------------------
rawgl: $(OBJS)
	$(CXX) -static-libgcc -static-libstdc++ \
        -o $@ $(OBJS) \
        -lmingw32 -mwindows \
        -lSDL2main -lSDL2 -lSDL2_mixer \
        -lopengl32 \
        /ucrt64/lib/libmt32emu.a \
        /ucrt64/lib/libz.a


# -----------------------------
#  Clean
# -----------------------------
clean:
	rm -f $(OBJS) $(DEPS) rawgl.exe rawgl

-include $(DEPS)

