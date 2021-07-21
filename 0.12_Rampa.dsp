// RAMPA 

/*
Una RAMPA 
è un segnale che produce un andamento crescente da un numero 
di partenza ad infinito. 
E tramite campioni viene implementata in modo che per ogni campione continui
a crescere di e da un valore definito in partenza.

Per comprendere il processo
bisogna fare però alcune premesse:
L'audio in digitale sappiamo che funziona per CAMPIONI. 
Dove i campioni sono dei valori COSTANTI 
per la loro definita durata di tempo.
Si susseguono tra loro in una successione costante
e lo fanno in un determinato lasso di tempo.
La loro quantità è definita dalla FREQUENZA DI CAMPIONAMENTO 
che è espressa in secondi,
che ci dice che ogni secondo corrisponde ad un tot. 
di campioni che si susseguono al suo interno:
Ad esempio: ad una frequenza di campionamento di 48000
abbiamo una successione di 48000 valori costanti (campioni) 
che vengono utilizzati per esprimere il nostro segnale in un secondo.
E quindi di conseguenza, a 48000samples 
per secondo avremo un nuovo campione ogni circa 0,021ms 
(in 1000ms=1secondo abbiamo 48000 valori che si susseguono) 
(1000 millisecondi /48000 campioni nei 1000 ms = 1 campione ogni 0,021ms).
Mentre il VALORE COSTANTE che rappresenta per la sua durata temporale
un campione, è definito in BIT.

Come creare una RAMPA:
per creare una rampa servendoci dei campioni, 
dobbiamo partire della creazione di un determinato LOOP: 
da cui partendo da un valore definito alla base, 
ad esempio 0.1 dato al primo campione,
e creando una somma ciclica di questo, dove ogni campione successivo
viene incrementato di questo valore rispetto al precedente,
(quindi creando un incremento infinito di 0.1)
e ipotizzando una situazione dove ogni campione abbia una durata di 10ms,
arriveremo tramite incrementi al valore di 1: 
in 10 CAMPIONI e 10 MILLISECONDI.
di conseguenza a due in 20 CAMPIONI e 20 MILLISECONDI, e così via.

Quindi:
se invece, ad una frequenza di campionamento 
abbiamo 48000 campioni al secondo
ed abbiamo un valore costante di 0.1 che incrementa ad ogni campione
del suo valore sommando se stesso (LOOP),
alla fine di un secondo 
il nostro valore incrementato sarà arrivato a 4800
a due secondi 9600, e così via... */

//CODICE:
//process = 0.1 : + ~ _;
//per vedere la rampa sull'oscilloscopio di FAUST:
    process = _; // commentare questo process.
//e avviare il process rimuovendo il commento alla riga sotto "CODICE:"
//disattivando però l'audio in uscita sul DAC.
//così da non danneggiare gli speaker con della Corrente Continua.
