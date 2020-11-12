#ifndef GRAPHICS_H
#define GRAPHICS_H

#include <map>
#include <string>

struct SDL_Window;
struct SDL_Renderer;

class Graphics {
public:
    Graphics();
    ~Graphics();

    SDL_Surface* loadImage(const std::string &filepath);

    // Draws a texture to a certain part of the screen
    void blitSurface(SDL_Texture* source, SDL_Rect* sourceRectangle, SDL_Rect* destinationRectangle);

    // Renders everything to the screen
    void flip();

    // Clears the screen (renderer)
    void clear();

    SDL_Renderer* getRenderer() const;
private:
    SDL_Window* _window;
    // Every frame, we clear the renderer, draw textures, then flip to draw them on the screen
    SDL_Renderer* _renderer;

    std::map<std::string, SDL_Surface*> _spriteSheets;
};

#endif