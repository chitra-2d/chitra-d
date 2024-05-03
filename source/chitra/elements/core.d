module chitra.elements.core;

import chitra.cairo;
import chitra.properties;

interface Element
{
    void draw(cairo_t* cairoCtx);
    string debugInfo();

    final void drawShapeProperties(cairo_t* cairoCtx, ShapeProperties shapeProps)
    {
        if (shapeProps.noFill)
            cairo_set_source_rgba(cairoCtx, 0, 0, 0, 0);
        else
            cairo_set_source_rgba(cairoCtx, shapeProps.fill.r,
                    shapeProps.fill.g, shapeProps.fill.b, shapeProps.fill.a);

        if (shapeProps.strokeWidth > 0)
        {
            cairo_fill_preserve(cairoCtx);
            cairo_set_line_width(cairoCtx, shapeProps.strokeWidth);
            // if @line_dash.enabled?
            //   LibCairo.cairo_set_dash(cairo_ctx, @line_dash.values.to_unsafe, @line_dash.values.size, @line_dash.offset)
            // else
            //   LibCairo.cairo_set_dash(cairo_ctx, [] of Float64, 0, 0)
            // end
            // LibCairo.cairo_set_line_cap(cairo_ctx, @line_cap)
            // LibCairo.cairo_set_line_join(cairo_ctx, @line_join)
            cairo_set_source_rgba(cairoCtx, shapeProps.stroke.r,
                    shapeProps.stroke.g, shapeProps.stroke.b, shapeProps.stroke.a);
            cairo_stroke(cairoCtx);
        }
        else
            cairo_fill(cairoCtx);
    }
}
