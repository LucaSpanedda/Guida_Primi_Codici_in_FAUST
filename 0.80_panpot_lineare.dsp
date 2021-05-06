// PANPOT LINEARE

import("stdfaust.lib");

// segnale in ingresso:
input = no.noise;

// controllo ampiezza segnale
input_amp = input * hslider("ampiezza segnale", 0, 0, 1, 0.01);

// panpot
panner_slider = hslider("panpot segnale",0,0,1, 0.01); // da 0. a 1.
panner_curve_1 = panner_slider; // curva del panner 1
panner_curve_2 = panner_slider *-1 +1 ; // curva del panner 2
process = input_amp*panner_curve_2, input_amp*panner_curve_1;
