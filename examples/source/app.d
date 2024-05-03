import std.stdio;

import chitra;

void main()
{
    auto ctx = new Chitra;
    ctx.fill("#dddddd");
    ctx.rect(50, 50, 500, 200);
    ctx.save("sample.png");
}
