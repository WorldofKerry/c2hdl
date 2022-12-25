while(true) {
    if (y <= y2) {
        state = 4; 
        y++;
        if (errR < 0) {
            xR++;
            errR = errR + 2*(y2-y1);
        } else {
            errR = errR - 2*(x2-x1);
        }
    } else {
        break;
        errR = 123; 
    }
}