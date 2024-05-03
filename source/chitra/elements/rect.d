module chitra.elements.rect;

import std.format;

import chitra.cairo;
import chitra.context;
import chitra.properties;
import chitra.elements.core;

class Rect : Element
{
    int x, y;
    float w, h;
    ShapeProperties shapeProps;

    this(int x, int y, float w, float h)
    {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    void draw(cairo_t* cairoCtx)
    {
        cairo_rectangle(cairoCtx, x, y, w, h);
        drawShapeProperties(cairoCtx, shapeProps);
    }

    string debugInfo()
    {
        return format("rect(x: %d, y: %d, w: %f, h: %f)", this.x, this.y, this.w, this.h);
    }
}

mixin template rectFunctions()
{
    /**
       Draw a Square or Rectangle.

       ---
       // Square of width 100
       //       x   y   w
       ctx.rect(50, 50, 100);

       // Rectangle of width 100 and height 50
       //       x   y   w    h
       ctx.rect(50, 50, 100, 50);
       ---
     */
    void rect(int x, int y, float w, float h = 0.0)
    {
        h = h == 0.0 ? w : h;
        auto r = new Rect(x, y, w, h);
        r.shapeProps = this.shapeProps;
        r.draw(this.defaultCairoCtx);
        this.elements ~= r;
    }
}
