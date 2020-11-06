import("stdfaust.lib");
//input
input = no.noise;
ampcontrol = input * hslider("ampiezza segnale filtrato",0,0,0.1, 0.01);

//filtro
IIR_1ord = ampcontrol <: (+ *0.95) ~ _, _ :> +;

//stereo out
process = IIR_1ord, IIR_1ord;
