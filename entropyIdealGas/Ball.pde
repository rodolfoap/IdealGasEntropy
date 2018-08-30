// This is the distance to separate the balls. No need to change it.
float minDistance = 2 * radius;
/**
 * The main Ball class. 
 */
class Ball {
        PVector position;
        PVector velocity;
        int name;
        float initialEnergy;
        float lastEnergy;

        // Constructor: creates the ball, defines some variables.
        Ball(float x, float y, PVector v, int bName) {
                position = new PVector(x, y);
                velocity = v;
                initialEnergy = energy();
                name = bName;
                lastEnergy=energy();
        }

	// At each loop, position is changed.
        void update() {
                position.add(velocity);
        }

	// The ball is drawn
        void display() {
                fill(color(0, 0, 0));
                ellipse(position.x, position.y, radius * 2, radius * 2);
                fill(color(0, 255, 0));
                text(this.name, position.x - 4, position.y + 4);
        }

	// Here, we check the collision agains the borders.
        void checkBorderCollision() {
                if (position.y > height - radius) {
                        position.y = height - radius;
                        velocity.y *= -1;
                } else if (position.y < radius) {
                        position.y = radius;
                        velocity.y *= -1;
                } else if (position.x < radius) {
                        position.x = radius;
                        velocity.x *= -1;
                } else if (position.x > (name==0?rWall:width) - radius) {
                        position.x = (name==0?rWall:width) - radius;
                        velocity.x *= -1;
                }
        }

        // Here, we check the collision agains other balls.
        void checkBallCollision(Ball other) {
                if (maxInteractions>0 && interaction>=maxInteractions) noLoop();
                PVector distanceVect = PVector.sub(other.position, position);
                float distanceVectMag = distanceVect.mag();
                if (distanceVectMag < minDistance) {	// Collision!
                        interaction++;

                        // before changing the speed, let's save the previous energy for both balls
                        this.lastEnergy=this.energy();
                        other.lastEnergy=other.energy();

                        // Correct distance to avoid overlapping: move the other
                        PVector distanceVectFixed=distanceVect.copy().normalize().mult(minDistance-distanceVect.mag());
                        other.position.add(distanceVectFixed);

                        // Rotate both speeds to emulate bouncing on a vertical wall
                        velocity.rotate(-distanceVectFixed.heading());
                        other.velocity.rotate(-distanceVectFixed.heading());

                        // Then, simply exchange horizontal speeds
                        float tempV=velocity.x;
                        velocity.x = other.velocity.x;
                        other.velocity.x = tempV;

                        // Rotate back to original coordinates
                        velocity.rotate(distanceVectFixed.heading());
                        other.velocity.rotate(distanceVectFixed.heading());

                        findEntropy();
                }
        }

	// Energy is calculated according to the speed. Mass is just 1.
        float energy() {
                return sq(velocity.mag()) / 2;
        }
        
        // The individual entropy change is calculated for each ball.
        float entropy() {
                // Third law of thermodynamics
                if (this.initialEnergy == 0) return 0;

                // The current entropy of the whole is calculated by adding the individual entropy of each ball, which would correspond to the 
                // energy state that's closer to the average 

                // Normally, entropy would be dQ/T, for motion we can use dE/E

                // So, we use Clausius' modified formula:
                else return(this.energy()-this.lastEnergy)/this.lastEnergy;

                // This case would reflect the entropy only regarding the initial energy distribution.
                // else return(this.energy()-this.initialEnergy)/this.initialEnergy;
        }
}
