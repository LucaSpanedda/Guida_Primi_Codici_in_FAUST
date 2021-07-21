// FASORE GLITCH

//Importo la libreria
import("stdfaust.lib");

/* Ora che abbiamo parlato molto della generazione di segnali
raccogliamo i dati esposti fino ad ora per generare un segnale
non convenzionale: un Fasore con dei Glitch interni controllati */

// SCATTERING PHASOR
scatteringphasor(freqnoise,freqphasor,seed) = scatteringphasor
with{
    varnoise = ( (seed) : (+ @(ma.SR/freqnoise)~ 
    *(1103515245)))/2147483647.0;
    scatteringphasor = (freqphasor/float(ma.SR)) : (+:ma.decimal)~ 
    (-(_<:(_,*(_,varnoise-varnoise@(1)))) :
    +(varnoise-varnoise@(1)));
};

process = scatteringphasor(2.4,0.5,8960458042),scatteringphasor(2.2,0.5,4362477819);
