module chitra.context;

import std.conv : to;
import std.string : toLower, split;
import std.algorithm.mutation : swap;

import chitra.cairo;
import chitra.paper_sizes;

// Import all the elements
import chitra.elements.core;

const DEFAULT_RESOLUTION = 300;
const DEFAULT_WIDTH = 700;
const PORTRAIT = "portrait";
const LANDSCAPE = "landscape";

// Convert from mm to Pixels with default resolution
int defaultResolutionPixels(int value)
{
    return to!int(((value / 10) / 2.54) * DEFAULT_RESOLUTION);
}

class Context
{
    Element[] elements;
    bool debugEnabled = false;
    cairo_surface_t* defaultSurface;
    int width;
    int height;
    static int resolution = 300;

    // Change the size as per the resolution specified
    // When a different resolution is specified other
    // than the default one, then correct it accordingly.
    int correctedSize(int value)
    {
        if (Context.resolution == DEFAULT_RESOLUTION)
            return value;

        return (value / DEFAULT_RESOLUTION) * Context.resolution;
    }

    this(int width = DEFAULT_WIDTH, int height = 0, int resolution = DEFAULT_RESOLUTION)
    {
        this.resolution = resolution;
        this.width = correctedSize(width);
        this.height = correctedSize(height == 0 ? width : height);
        this.defaultSurface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32,
                this.width, this.height);
    }

    this(string paper, int resolution = DEFAULT_RESOLUTION)
    {
        string orientation = PORTRAIT;
        auto parts = paper.toLower.split(",");
        if (parts.length == 2)
        {
            if (parts[0] == PORTRAIT || parts[0] == LANDSCAPE)
            {
                paper = parts[1];
                orientation = parts[0];
            }
            else if (parts[1] == PORTRAIT || parts[1] == LANDSCAPE)
            {
                paper = parts[0];
                orientation = parts[1];
            }
        }

        auto size = paper in PAPER_SIZES;
        if (size is null)
        {
            throw new Exception("invalid paper");
        }
        auto w = defaultResolutionPixels((*size)[0]);
        auto h = defaultResolutionPixels((*size)[1]);

        if (orientation == LANDSCAPE)
            swap(w, h);

        this(w, h, resolution);
    }

    void enableDebug()
    {
        this.debugEnabled = true;
    }

    void disableDebug()
    {
        this.debugEnabled = false;
    }
}
