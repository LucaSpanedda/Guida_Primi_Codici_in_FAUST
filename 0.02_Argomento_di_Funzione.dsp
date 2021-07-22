// ARGOMENTO DI FUNZIONE

//Importo la libreria standard di FAUST
import("stdfaust.lib");

//creo una funzione che sottragga i numeri interi lasciando i decimali
decimale(x) = x-int(x);

/* In Faust oltre alle funzioni possiamo usare
gli argomenti di una funzione.
Posso mettere un argomento alla funzione quando la scrivo
in questo modo:
funzione(argomento di funzione 1, argomento 2, ecc.) = 
argomento di funzione 1, argomento2, ecc. ;
posso a seguito o a priori definire gli argomenti di una funzione:
argomento di funzione 1 = 100.;
questo vorrà dire che ognivolta che nel codice ho utilizzato 
un "argomento di funzione 1" sarà uguale al contenuto della funzione
cioè = 100. */

fasore(frequenza) = (frequenza/ma.SR : (+ : decimale)~_);

/* in questo caso all'output della funzione, quando la richiamo,
posso dunque dichiarare l'argomento esprimendo il valore
tra le parentesi, come nel process qui per la frequenza */

// out del segnale sul canale 1,2 del DAC
process = fasore(100)*2-1 <:_,_;
