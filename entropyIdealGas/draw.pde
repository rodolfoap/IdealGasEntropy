// Processing3 loops this after running the setup() function. 
void draw() {
        background(0);
        stroke(color(0, 255, 0));
        for (Ball b : balls) {
                b.update();
                b.display();
                b.checkBorderCollision();
        }
        for (int i=0; i<balls.length; i++) {
                for (int j=i+1; j<balls.length; j++) { 
                        balls[i].checkBallCollision(balls[j]);
                }
        }
        drawWall();
        drawEntropy();
}
