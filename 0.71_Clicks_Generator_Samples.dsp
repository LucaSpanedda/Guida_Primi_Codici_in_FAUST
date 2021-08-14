// ---------------------------------------------------------------------------------

// import Standard Faust library
// https://github.com/grame-cncm/faustlibraries/
import("stdfaust.lib");

clicks(seed,f,samples,amp) = outimpulse
with{
varnoise = (((seed) : (+ @(ma.SR/f)~ *(1103515245)))/2147483647.0);
routeimpulse(a,b) = a : _@(samples), b :> - : _ > 0;
noisemaj = varnoise>0;
noisemin = varnoise<0;
majimpulse = noisemaj <: routeimpulse;
minimpulse = noisemin <: routeimpulse *-1;
outimpulse = majimpulse + minimpulse : _*amp;
};


// clicks(seed,f,samples,amp)
process = clicks(1020,10,3,0.5), clicks(1024,10,3,0.5);

// ---------------------------------------------------------------------------------
