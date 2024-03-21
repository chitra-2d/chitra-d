module chitra.helpers;

import chitra.context;

T inch(T)(T value)
{
    return Context.resolution * value;
}

T cm(T)(T value)
{
    return (value/2.54).inch;
}

T mm(T)(T value)
{
    return (value/10).cm;
}
