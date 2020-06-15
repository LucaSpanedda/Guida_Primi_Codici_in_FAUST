import("stdfaust.lib");
//input
input = no.noise;
ampcontrol = input * hslider("ampiezza segnale filtrato",0,0,0.5, 0.01);

//filtro
FIR = ampcontrol <: mem, _ :> +;

//stereo out
process = FIR,FIR;