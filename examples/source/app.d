import std.stdio;

import chitra;

void main()
{
    auto ctx = new Chitra;
    ctx.fill("#dddddd");
    ctx.rect(50, 50, 500, 200);
    ctx.fill(0, 0, 1);
    ctx.polygon([[50, 450], [50, 50], [450, 50], [100, 100]], true);
    ctx.fill(0.5);
    ctx.polygon([150, 450, 150, 50, 550, 50, 200, 100], true);
    ctx.save("sample.png");
}
