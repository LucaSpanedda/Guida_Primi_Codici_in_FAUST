// Creazione di un onda sinusoidale:

import("stdfaust.lib");
decimale(x) = x-int(x);
phase(f) = f/ma.SR : (+ : decimale) ~ _;
sinusoid(f) = sin(phase(f)* 2 *ma.PI);

process = 
    sinusoid(300), sinusoid(301);
