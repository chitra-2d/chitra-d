module chitra.elements.new_page;

import chitra.cairo;
import chitra.elements.core;

class NewPage : Element
{
    void draw(cairo_t* cairoCtx)
    {
        cairo_show_page(cairoCtx);
    }
}

mixin template newPageFunctions()
{
    /**
       Creates a new page.

       ---
       ctx.newPage;
       ---
     */
    void newPage()
    {
        auto s = new NewPage;
        s.draw(this.defaultCairoCtx);
        this.elements ~= s;
    }
}
