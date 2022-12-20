fillTriangle(int x1, int y1, int x2, int y2)
{
    int errR = (y2 - y1) - 2 * (x2 - x1);
    int xR = x1;
    int y = y1;
    while (y <= y2)
    {
        int x = x1;
        while (x <= xR)
        {
            setPixel(x, y, 1);
            x++;
        }
        while (errR < 0)
        {
            xR++;
            errR = errR + 2 * (y2 - y1);
        }
        errR = errR - 2 * (x2 - x1);
        y++;
    }
    int counter = 0;
    while (counter < 10)
    {
        counter++;
    }
    counter *= 2;
}

int errR = (y2 - y1) - 2 * (x2 - x1);
int xR = x1;
int y = y1;
while (y <= y2)
{
    int x = x1;
    while (x <= xR)
    {
        plot = 1; 
        x = x + 1;
    }
    while (errR < 0)
    {
        xR = xR + 1;
        errR = errR + 2 * (y2 - y1);
    }
    errR = errR - 2 * (x2 - x1);
    y = y + 1;
}
int counter = 0;
while (counter < 10)
{
    counter++;
}
counter *= 2;