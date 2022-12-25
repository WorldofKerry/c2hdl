    if ((x - cx) * (x - cx) + (y - cy) * (y - cy) <= r * r)
    {
        plot = 1;
    }
    y++;
    if (y > cy + r)
    {
        y = cy - r;
        x++;
        if (x > cx + r)
        {
            break;
        }
    }