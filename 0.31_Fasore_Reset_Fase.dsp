// FASORE con RESET della fase

//Importo la libreria
import("stdfaust.lib");

/* Ora che abbiamo parlato della generazione del fasore
raccogliamo i dati esposti fino ad ora per generare un segnale
non convenzionale: un Fasore con un reset della fase */

but = button("[1]gate segnale");

decimale(x)= x-int(x);
// reset passando alla variabile reset 1. Non reset = 0.
zerophase(reset) = 0.00002 : (+ : decimale) * (1-reset)~ _ ;

process = zerophase(but);
