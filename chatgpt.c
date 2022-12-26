x = x1;
y = y1;
while (true) {
    plot = 1;
    if (x < x2) {
        x++;
    }
    if (!(x < x2)) {
        if (y < y2) {
            x = x1;
            y++;
        } else {
            break;
        }
    }
}
