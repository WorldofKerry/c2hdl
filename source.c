int errR = (y2 - y1) - 2 * (x2 - x1);
int xR = x1;
int y = y1;
while (y <= y2)
{
    int x = x1;
    while (x <= xR)
    {
        plot = 1; 
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