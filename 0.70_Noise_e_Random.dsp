// RUMORE BIANCO E RANDOM

/* per generare del rumore bianco in FAUST
occorre creare una retroazione come per un fasore,
ma invece che creare un processo di accumulazione,
bisogna creare un sistema che generi un numero casuale
per ogni campione.*/

// Importo la libreria standard
import("stdfaust.lib");

// NOISE 
// in questo caso passiamo un valore di seed (seme) 
// per generare sulla base di questo un numero casuale
noise(seed) = (+(seed)~*(1103515245))/2147483647.0;
// NOISE A FREQUENZA VARIABILE
// in questo caso invece oltre che al seed
// nella retroazione è stato aggiunto un valore di ritardo
// per controllare la frequenza di generazione dei valori casuali
varnoise(freq,seed) = ((seed) : (+ @(ma.SR/freq)~ 
                            *(1103515245))) /2147483647.0; 
                            
// Uscita del segnale con il process
process = noise(8960458042) <:_,_;
