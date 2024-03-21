module chitra;

import std.stdio;
import std.conv;

public import chitra.helpers;

import chitra.context;
import chitra.elements.rect;

class Chitra : Context
{
    this(string paper, int resolution=DEFAULT_RESOLUTION)
    {
        super(paper, resolution);
    }

    this(int width, int height)
    {
        super(width, height, DEFAULT_RESOLUTION);
    }

    this(int width, int height, int resolution)
    {
        super(width, height, resolution);
    }

    void rect(int x, int y, float w, float h)
    {
        auto r = new Rect(x, y, w, h);
        this.elements ~= r;
    }

    void rect(int x, int y, float w)
    {
        this.rect(x, y, w, w);
    }
}
