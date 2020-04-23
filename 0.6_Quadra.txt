// Creazione di un onda quadra:

import("stdfaust.lib");
decimale(x) = x-int(x);
phase(f) = f/ma.SR : (+ : decimale) ~ _;

// Passa della rampa solo il segnale maggiore di 0.5 divenendo 1.
// ed il minore diventa 0.
// infine il segnale viene riscalato tra fase positiva e negativa 
// (-1. e +1.)
saw(f) = (((phase(f) > 0.5) -0.5) *2);

process = 
    // le due frequenze in uscita dei/ e i due oscillatori
    saw(120), saw(120.2);
