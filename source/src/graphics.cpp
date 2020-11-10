
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

#include "graphics.h"


Graphics::Graphics(){
    //SDL_Init(SDL_INIT_VIDEO);
    SDL_CreateWindowAndRenderer(640, 480, 0, &this->_window, &this->_renderer);
    SDL_SetWindowTitle(this->_window, "Baulk");
}

Graphics::~Graphics(){
    SDL_DestroyWindow(this->_window);
    SDL_DestroyRenderer(this->_renderer);
}

SDL_Surface* Graphics::loadImage(const std::string &filepath){
    if(this->_spriteSheets.count(filepath) == 0){
        this->_spriteSheets[filepath] = IMG_Load(filepath.c_str());
    }
    return this->_spriteSheets[filepath];
}

void Graphics::blitSurface(SDL_Texture* texture, SDL_Rect* sourceRectangle, SDL_Rect* destinationRectangle){
    SDL_RenderCopy(this->_renderer,texture,sourceRectangle,destinationRectangle);
}

void Graphics::flip(){
    SDL_RenderPresent(this->_renderer);
}

void Graphics::clear(){
    SDL_RenderClear(this->_renderer);
}

SDL_Renderer* Graphics::getRenderer() const{
    return this->_renderer;
}