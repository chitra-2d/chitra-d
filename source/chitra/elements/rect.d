module chitra.elements.rect;

import std.format;

import chitra.cairo;
import chitra.properties;
import chitra.elements.core;

class Rect : Element
{
    double x, y;
    double w, h;
    ShapeProperties shapeProps;

    this(double x, double y, double w, double h)
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
        return format("rect(x: %f, y: %f, w: %f, h: %f)", this.x, this.y, this.w, this.h);
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
    void rect(double x, double y, double w, double h = 0.0)
    {
        h = h == 0.0 ? w : h;
        auto r = new Rect(x, y, w, h);
        r.shapeProps = this.shapeProps;
        r.draw(this.defaultCairoCtx);
        this.elements ~= r;
    }

    /**
       Draw a Square.

       ---
       // Square of width 100
       //         x   y   w
       ctx.square(50, 50, 100);
       ---
     */
    void square(double x, double y, double w)
    {
        rect(x, y, w);
    }
}
