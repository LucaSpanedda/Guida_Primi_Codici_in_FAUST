import("stdfaust.lib");

/*

Logaritmo: 
potenza = numero alla base, e risultato del numero alla base per la potenza.
ex. potenza di 4 = logaritmo in base 4 di 16 (16 = risultato base 4 alla ^4).
Decibel : 
Il decibel (simbolo ㏈) è la decima parte del bel (simbolo B): 10 ㏈ = 1 B ed è un'unità di misura logaritmica del rapporto fra due grandezze omogenee (di potenze). Il valore ottenuto da un logaritmo è per definizione un numero puro (adimensionale), ma vi può essere associata un'unità di misura per indicare la base del logaritmo utilizzato.


Logarithm:
power = number at the base, and result of the number at the base for the power.
EX. power of 4 = log base 4 of 16 (16 = result base 4 to ^ 4).
Decibel:
The decibel (symbol ㏈) is the tenth part of the bel (symbol B): 10 ㏈ = 1 B and is a logarithmic unit of measurement of the ratio between two homogeneous quantities (of powers). The value obtained from a logarithm is by definition a pure (dimensionless) number, but a unit of measurement can be associated with it to indicate the base of the logarithm used.

*/

// Conversions Formula: dB to a linear gain (0-1) and linear to dB
lineartodB(g) = 20.0*log10(max(ma.MIN, g));
dBtolinear(l) = pow(10.0, l/20.0);

// GUI Slider in dB = -80 to 0 dB
SliderdB = hslider("Slider in dB",-80,-80,0,0.001) : si.smoo : dBtolinear
with{
    dBtolinear(G) = pow(10.0, G/20.0);
    };

process = no.noise*SliderdB <: _,_;
