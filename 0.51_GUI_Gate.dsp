/* -------------------------------------------------------------- 80 caratteri -
-------- 0.51- GUI GATE ------------------------------------------------------*/

// In FAUST è possibile controllare i segnali in ingresso tramite 
// un interfaccia grafica.
// Il Gate è il più semplice degli oggetti grafici
import("stdfaust.lib");

// segnale in ingresso:
input = no.noise;

// input moltiplicati per il gate di segnale (0. e 1.)
process = input*button("[1]gate segnale"), input*button("[1]gate segnale");
