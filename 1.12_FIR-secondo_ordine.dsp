import("stdfaust.lib");
//input
input = no.noise;
ampcontrol = input * hslider("ampiezza segnale filtrato",0,0,0.25, 0.01);

//filtro
FIR_2ord = ampcontrol <: _, @(1)+@(2) :> +;

//stereo out
process = FIR_2ord,FIR_2ord;
