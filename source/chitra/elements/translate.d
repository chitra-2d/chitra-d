module chitra.elements.translate;

import std.format;

import chitra.cairo;
import chitra.elements.core;

class Translate : Element
{
    double x, y;

    this(double x, double y)
    {
        this.x = x;
        this.y = y;
    }

    void draw(cairo_t* cairoCtx)
    {
        cairo_translate(cairoCtx, x, y);
    }

    string debugInfo()
    {
        return format("translate(x: %f, y: %f)", this.x, this.y);
    }
}

mixin template translateFunctions()
{
    /*
      Translate the canvas to given x and y

      ---
      auto ctx = new Chitra;
      ctx.translate(100, 100);
      ctx.rect(0, 0, 500, 500);
      ---
    */
    void translate(double x, double y)
    {
        // TODO: Handle when scaled state is implemented
        // @current_saved_context.add_transformation(s) if @current_saved_context.enabled?
        auto s = new Translate(x, y);
        s.draw(this.defaultCairoCtx);
        this.elements ~= s;
    }
}
