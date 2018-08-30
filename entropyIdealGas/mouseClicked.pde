// Controls the compartments separator
void mouseClicked() {
        if (rWall<width) {
                rWall=width;
        } else {
                rWall=radius*4; 
                setup();
        }
}
