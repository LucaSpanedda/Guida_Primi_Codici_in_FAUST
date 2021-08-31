// RAMPA LINEARE

//Importo la libreria
import("stdfaust.lib");

/* cambiamo la logica di generazione del Fasore
per generare al suo posto una rampa lineare. */

trig = button("[1]phase reset");
milliseconds = 1000;

// decimalramp permette di passare ai valori solo quando sono tra 0. e 1.
decimalramp(a) = (a < 1) * a;
// linephasor genera una rampa infinita, la cui retroazione si svuota
// quando il valore crescente al suo interno viene moltiplicato * 0.
linephasor(ms,trigger) = +( ((1/ma.SR)/ms)*1000 ) *(1-trig)~_  : decimalramp;

process = linephasor(milliseconds,trig);
