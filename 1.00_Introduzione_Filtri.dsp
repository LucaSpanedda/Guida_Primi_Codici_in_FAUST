// FILTRI DIGITALI

/*
Introduction to Digital Filters: 
With Audio Applications.
Libro di Julius O. Smith III.

Links alla serie di Libri di Smith:
1 Mathematics of the Discrete Fourier Transform (DFT)
2 Introduction to Digital Filters
3 Physical Audio Signal Processing
4 Spectral Audio Signal Processing

sulla pagina CCRMA di J.Smith
https://ccrma.stanford.edu/~jos/fp/

su DSP Related
https://www.dsprelated.com/freebooks.php
*/


//Importo la libreria
import("stdfaust.lib");

// Esempio di logica di un filtro in Faust:
// con un One Zero Filter - (in FIR)
// designato il segnale che deve andare 
// in input al filtro:

// <: indica che il segnale esce su due percorsi
// _' è il ritardo di un campione sul primo percorso,
// la virgola dopo il _', indica 
// che si passa a trattare la seconda uscita
// (secondo percorso), e il _ è il bypass.
// I segnali si ricombinano sulla somma +;

Onezerofilter = no.noise <: _' , _ :> +;

//Process
process = Onezerofilter*0, Onezerofilter*0;