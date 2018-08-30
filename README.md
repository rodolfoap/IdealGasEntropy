# EntropyBouncingBalls
A tool to assess the behavior of thermodynamic entropy for an ideal gas, using motion (kinetic) energy equivalences to dQ/T.

This is an example of a classical thermodynamic system of two reservoires that become a single one after a wall is removed. There is a molecule with some energy in an isolated container, and the other container has a set of molecules without energy. When both containers are communicated, entropy will grow. A blue curve will show the behavior of the entropy curve.

# Usage
* Install Processing-3 from https://processing.org/download/.
* Run sketch.
* Click on the reservoire, in order to open the wall and allow energy to be transferred to the big container.
* See the blue curve, representing the total entropy (S).
* The values of entropy and energy are also printed on the Processing-3 console: individually and totals.

# Notes
* The energy on both containers remains constant, first thermodynamic principle. It is constantly calculated by accumulating the kinetic energy of all the balls.

* Energy is constant, it is calculated using...

\Delta S=\frac{dQ}{T}

But since we're not dealing with thermodynamic forms of energy, but motion, we can just use kinetic energy (according to Arieh Ben-Naim, temperature is energy, and should carry energy units, such perspective is accepted here):

\Delta S=\frac{dK}{K}

considering that ...

K=\frac{mv^{2}}{2}

* The balls have a small initial amount of energy, to avoid excessive growth of entropy, difficult to graph.

* Check the Ball class. Entropy can be generated in different forms. You may want to tune the drawing parameters to get a proper visualization. By default, the accumulated entropy is calculated. But you might want to see the behavior of delta S.

Enjoy.
