// After drawing the balls for each frame, the curve is also drawn over. 
// This function is called once each loop (see draw()).
void drawEntropy() {
        //  stroke(color(64, 64, 64));
        //  line(0, height -shift, width, height -shift);
        stroke(color(0, 63, 127));
        lastX=0; 
        lastY=height-shift;
        for (int frame=0; frame<interaction; frame++) {
                line(lastX, lastY, frame, height-(entropyCurve[frame]*entropyScale+1)-shift);
                lastX= frame; 
                lastY = int(height-(entropyCurve[frame]*entropyScale+1)-shift);
        }
}
