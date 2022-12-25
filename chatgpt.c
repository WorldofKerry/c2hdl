cx = 100;
cy = 150;
r = 50;
x = cx - r;
y = cy - r;

while (true) {
    if (y > cy + r) {
        break;
    }
    if (x > cx + r) {
        y++;
        x = cx - r;
    }
    state = state;
    x++;
}
