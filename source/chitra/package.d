module chitra;

import std.stdio;
import std.conv;

public import chitra.helpers;

import chitra.context;

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
}
