/** 
 * Set your startup variables here
 */

// Set maxInteraction to a positive number to stop after a number of bounces, or zero to never stop
int maxInteractions=0;

// Choose the balls number. Careful: you need to define its initial locations.
int totalBalls=10;

// Choose the ball radius; mass is always 1.
int radius=30;

// The scale of the graph (entropy could reach very high values, this parameter would require tuning for every configuration 
float entropyScale=0.0001;
        
// The graph starts on the bottom and can be shifted. No change needed on this universe, where entropy always grows. 
int shift=0;

/** 
 * Initial values below, not to be changed.
 */

// Used to draw lines for the entropy curve.
int lastX=0; 
int lastY=0;
// Each ball bouncing counts as an interaction. Entropy is calculated after each interaction.
int interaction=0;
// The total energy of the system. Changes as soon as the system gets configured.
float totalEnergy; 
// The total entropy of the system. Changes as soon as the system gets configured.
float totalEntropy;
// The previous entropy value, used to draw the entropy curve,
float lastEntropy = 0;
// The right wall for the first ball.
int rWall=radius*4;
// A matrix containing the curve. 
int[] entropyCurve;
// A matrix containing the Ball instances. 
Ball[] balls=new Ball[totalBalls];

// Processing3 runs this function only once, to setup the context.
void setup() {
        // The dimensions of the scenario
        size(1000, 400);
        // We create the array, with as many frames as the window width
        entropyCurve=new int[width];

        // Ball 0 has the energy to disperse, x and y positions are r*3/2; 
        // the velocity magnitude is determined by the vector components, in this case, (3, 4);
        // energy is calculated using e=mv^2/2; since m=1, the initial whole energy is (9+25)/2=12.5
        balls[0]=new Ball(radius*1.5, radius*1.5, new PVector(3, 4), 0);

        // Ball 0 has the energy to disperse.
        for (int number=1; number<totalBalls; number++) {
                // Initially, we need energy>0 in order to have a positive entropy. Not so much energy to sum.
                balls[number]=new Ball(radius*3 + number*radius*2.5, radius*1.5, new PVector(0, 0.01), number);
        }
        // Before starting, let's introduce the first value into the matrix curve.
        //findEntropy();
}
