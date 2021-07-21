// SINUSOIDE 

//Importo la libreria
import("stdfaust.lib");

//creo una funzione che sottragga i numeri interi lasciando i decimali
decimale(x) = x-int(x);

//creo una funzione in cui stabilisco la frequenza da utilizzare
// e da richiamare a seguito all'occorrenza
frequenza = 440;

//stabilisco la frequenza del fasore:
//dividendola per il Sample Rate,
//e creo il fasore generando il loop  dei soli numeri decimali
fasore = frequenza/ma.SR : (+ : decimale) ~ _;

/* ora dobbiamo generare la sinusoide partendo dal fasore:
per creare una sinusoide partendo dal fasore
dobbiamo innanzitutto riscalare questi valori che nel tempo
si muovono tra 0. e 1. (del fasore) per far si che si muovano
per un valore espresso in radianti, 
che ci permette di calcolare una circonferenza, e che sappiamo essere
di 2 volte PI GRECO. 
il valore di PI GRECO approssimato che useremo è di 3.1415926535897932385
moltiplicato per due è di : 6.2831853071795, e quindi: */
due_pigreco = 6.2831853071795;

// ora dobbiamo creare una funzione per dire al fasore di percorrere
// tutta la lunghezza della circonferenza (6.283185...) 
// non andrà più quindi da 0. a 1. ma da 0. a 6.283185... (due pi)
fasore_pi = fasore * due_pigreco;

// ed infine il nostro sin ci restituirà i valori di ampiezza
// che il nostro fasore ora della lunghezza della circonferenza
// deve seguire per restituirci un onda sinusoidale
sinusoide = sin(fasore_pi) ;

//process sono le nostre 2 uscite per la sinusoide generata
process = sinusoide, sinusoide;
    
/* la nostra sinusoide viene automaticamente assegnata in uscita
a due canali 1 & 2.
(segnale mono, per sorgenti di ascolto L & R). */
