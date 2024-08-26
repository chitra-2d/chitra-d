module chitra.properties;

import std.format;
import std.string;
import std.conv;

struct TextProperties
{
    string font = "Serif";
    string slant = "Normal";
    string weight = "Normal";
    int height = 12;
    double lineHeight = 1.5;
    string align_ = "left";
    string hyphenChar = "-";
    bool hyphenation = false;
}

struct Color
{
    double r;
    double g;
    double b;
    double a = 1.0;

    string debugInfo()
    {
        return format("RGBA(%.2f, %.2f, %.2f, %.2f)", r, g, b, a);
    }

    this(double r, double g, double b, double a = 1.0)
    {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }

    this(double gray, double a = 1.0)
    {
        this.r = gray;
        this.g = gray;
        this.b = gray;
        this.a = a;
    }

    static Color fromHexString(string value)
    {
        auto h = value.strip("#");
        Color color;
        color.r = h[0 .. 2].to!int(16) / 255.0;
        color.g = h[2 .. 4].to!int(16) / 255.0;
        color.b = h[4 .. 6].to!int(16) / 255.0;

        color.a = h.length == 8 ? h[6 .. 8].to!int(16) / 255.0 : 1.0;

        return color;
    }

    //   def self.rgba2hex(r, g, b, a = 1.0)
    //     r_hex = (r*255).to_i.to_s(16).rjust(2, '0')
    //     g_hex = (g*255).to_i.to_s(16).rjust(2, '0')
    //     b_hex = (b*255).to_i.to_s(16).rjust(2, '0')
    //     a_hex = (a*255).to_i.to_s(16).rjust(2, '0')
    //     "##{r_hex}#{g_hex}#{b_hex}#{a_hex}"
    //   end
    // end
}

struct ShapeProperties
{
    Color fill;
    Color stroke;
    int strokeWidth = 1;
    bool noFill = false;
    // line_dash = LineDash.new,
    //     line_cap = LibCairo::LineCapT::Butt,
    //   line_join = LibCairo::LineJoinT::Miter
}

mixin template propertiesFunctions()
{
    void fill(double r, double g, double b, double a = 1.0)
    {
        shapeProps.noFill = false;
        shapeProps.fill = Color(r, g, b, a);
    }

    void fill(double gray, double a = 1.0)
    {
        shapeProps.noFill = false;
        shapeProps.fill = Color(gray, a);
    }

    void fill(string hexValue)
    {
        shapeProps.noFill = false;
        shapeProps.fill = Color.fromHexString(hexValue);
    }

    void stroke(double r, double g, double b, double a = 1.0)
    {
        shapeProps.stroke = Color(r, g, b, a);
    }

    void stroke(double gray, double a = 1.0)
    {
        shapeProps.stroke = Color(gray, a);
    }

    void stroke(string hexValue)
    {
        shapeProps.stroke = Color.fromHexString(hexValue);
    }

    void noStroke()
    {
        shapeProps.strokeWidth = 0;
    }

    void strokeWidth(int value)
    {
        shapeProps.strokeWidth = value;
    }

    void noFill()
    {
        shapeProps.noFill = true;
    }
}
