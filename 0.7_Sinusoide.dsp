//Importo la libreria
import("stdfaust.lib");
//creo una funzione che sottragga i numeri interi lasciando i decimali
decimale(x) = x-int(x);
//creo una funzione in cui stabilisco la frequenza da utilizzare
frequenza = 300;

//stabilisco la frequenza dell'oscillatore dividendola per il Sample Rate 
//e creo l'oscillatore-fasore generando il loop  dei soli numeri decimali
phase = frequenza/ma.SR : (+ : decimale) ~ _;
//formula per generare la sinusoide partendo dal fasore
sinusoid = sin(phase* 2 *ma.PI);

//process sono le nostre uscite
process = 
    sinusoid, sinusoid;
    
//abbiamo quindi in uscita due sinusoidi in parallelo per la stessa frequenza.
//che vengono automaticamente assegnati ai canali di uscita 1 & 2.
//(in stereofonia sorgenti di ascolto L & R)
