cx = 100;
cy = 150;
r = 50;
x = cx - r;
y = cy - r;

for (x = cx - r; x <= cx + r; x++)
{
    for (y = cy - r; y <= cy + r; y++)
    {
        if ((x - cx) * (x - cx) + (y - cy) * (y - cy) <= r * r)
        {
            plot = 1;
        }
    }
}