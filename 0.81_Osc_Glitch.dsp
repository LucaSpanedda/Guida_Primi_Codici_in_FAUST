//Importo la libreria
import("stdfaust.lib");

// OSC GLITCH
scatteringosc(freqnoise,samples,freqphasor,seed,amp) = scatsineout
with{
    varnoise = ( (seed) : (+ @(ma.SR/freqnoise)~ 
    *(1103515245)))/2147483647.0;
    scatteringphasor = (freqphasor/float(ma.SR)) : (+:ma.decimal)~ 
    (-(_<:(_,*(_,varnoise-varnoise@(samples)))) :
    +(varnoise-varnoise@(1)));
    due_pigreco = 6.2831853071795;
    scatsineout = amp*sin(scatteringphasor* due_pigreco);
};

process = 
scatteringosc(8,1000,220,12468901,0.10)+
scatteringosc(4,100,254,15568902,0.10),
scatteringosc(4,1000,280,15118902,0.10)+
scatteringosc(8,100,380,15588911,0.10);
