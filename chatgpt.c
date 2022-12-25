cx = 100;
cy = 150;
r = 50;
x = cx - r;
y = cy - r;

while (true) {
  if (x > cx + r) {
    break;
  }
  if (y > cy + r) {
    x++;
    y = cy - r;
  }
  plot = 1;
  y++;
}