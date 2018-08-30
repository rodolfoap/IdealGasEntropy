// Calculates the entropy
void findEntropy() {
        // The energy is calculated by adding all the individual ball's energy values, and must keep constant.
        print("E: ");
        totalEnergy=0;
        for (int k = 0; k < balls.length; k++) {
                totalEnergy += balls[k].energy();
                print(balls[k].name + ":" + nfp(balls[k].energy(), 1, 2)+"; ");
        }
        println("TOTAL: " + nfp(totalEnergy, 1, 2));

        // Entropy is calculated by adding all the individual entropy values, and must tend to a constant.

        // it is interesting to observe the behavior of dS. To check the accumulated total, just comment the next line: 
        // totalEntropy=0;
        
        print("S: ");
        for (int k = 0; k < balls.length; k++) {
                totalEntropy += balls[k].entropy();
                print(balls[k].name + ":" + nfp(balls[k].entropy(), 1, 2)+"; ");
        }
        print("TOTAL: " + nfp(totalEntropy, 1, 2)+"\n\n");

        // We use int() because this is a screen coordinate
        entropyCurve[interaction]=int(totalEntropy);
}
