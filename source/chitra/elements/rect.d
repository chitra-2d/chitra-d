module chitra.elements.rect;

import std.format;

import chitra.context;
import chitra.elements.core;

class Rect : Element
{
    int x, y;
    float w, h;

    this(int x, int y, float w, float h)
    {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    void render()
    {
    }

    string debugInfo()
    {
        return format("rect(x: %d, y: %d, w: %f, h: %f)", this.x, this.y, this.w, this.h);
    }
}
