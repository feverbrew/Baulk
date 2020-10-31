CC=g++
CFLAGS= -g -Wall
INCLUDES = -I./source/headers/ -I/usr/local/include/SDL2/
SDL_CFLAGS := $(shell sdl2-config --cflags)
SDL_LDFLAGS := $(shell sdl2-config --libs)

baulkmake: main.o graphics.o game.o
	$(CC) $(CFLAGS) $(INCLUDES) -o baulkmake main.o graphics.o game.o $(SDL_CFLAGS) $(SDL_LDFLAGS)

main.o: ./source/src/main.cpp ./source/headers/game.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/main.cpp

graphics.o: ./source/src/graphics.cpp ./source/headers/graphics.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/graphics.cpp $(SDL_CFLAGS) $(SDL_LDFLAGS)

game.o: ./source/src/game.cpp ./source/src/graphics.cpp ./source/headers/game.h
	$(CC) $(CFLAGS) $(INCLUDES) -c ./source/src/game.cpp $(SDL_CFLAGS) $(SDL_LDFLAGS)