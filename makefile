CC=g++
CFLAGS= -g -Wall
INCLUDES = -I./source/headers/ -I/usr/local/include/SDL2/ -I/usr/include/c++/5/
SDL_CFLAGS := $(shell sdl2-config --cflags)
SDL_LDFLAGS := $(shell sdl2-config --libs)

baulkmake: main.o graphics.o game.o input.o sprite.o animatedsprite.o
	$(CC) $(CFLAGS) $(INCLUDES) -o baulkmake main.o graphics.o game.o input.o sprite.o animatedsprite.o $(SDL_CFLAGS) $(SDL_LDFLAGS) -lSDL2_image

main.o: ./source/src/main.cpp ./source/headers/game.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/main.cpp

sprite.o: ./source/src/sprite.cpp ./source/headers/sprite.h ./source/headers/graphics.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/sprite.cpp $(SDL_CFLAGS) $(SDL_LDFLAGS)

animatedsprite.o: ./source/src/animatedsprite.cpp ./source/headers/animatedsprite.h ./source/headers/sprite.h ./source/headers/graphics.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/animatedsprite.cpp $(SDL_CFLAGS) $(SDL_LDFLAGS)

graphics.o: ./source/src/graphics.cpp ./source/headers/graphics.h ./source/headers/globals.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/graphics.cpp $(SDL_CFLAGS) $(SDL_LDFLAGS) -lSDL2_image

input.o: ./source/src/input.cpp ./source/headers/input.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/input.cpp $(SDL_CFLAGS) $(SDL_LDFLAGS)

game.o: ./source/src/game.cpp ./source/src/graphics.cpp ./source/headers/input.h ./source/headers/game.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/game.cpp $(SDL_CFLAGS) $(SDL_LDFLAGS)