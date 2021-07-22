// FASORE 

/* Per ottenere un segnale FASORE, 
dal nostro segnale di Rampa ad incremento infinito,
vogliamo creare un segnale che si ripete 
secondo tale andamento ciclicamente ogni tot. campioni
che determinano di conseguenza il suo incremento, 
da un punto di partenza ad un punto di fine:
Dobbiamo creare una funzione che faccia si di ESCLUDERE I NUMERI INTERI
che sappiamo essere in una RAMPA crescenti all'infinito.
E mantenere dunque invece, 
i suoi decimali che hanno un determinato incremento alla base
che si ripete crescendo sino ad arrivare ad un numero intero.

decimale(x) è la nostra prima funzione, in cui determiniamo che: 
decimale vuole dire che ad x sottraiamo gli interi di x, 
e quindi avremo i decimali di x
decimale(x)= x-int(x);

fasore è la nostra seconda funzione, e dice che 
0.002 in uscita è connesso in entrata 
(:) a + (+ connesso a funzione decimale) 
e tutto questo avviene in loop ~
(~ che punta al primo ingresso disponibile nella funzione)
fasore = 0.002 : (+ : decimale) ~ _;

il fasore muovendo ogni campione per un incremento di 0.002 
arriva da 0.002 a 1 in 500 campioni
500 incrementi susseguenti di 0.002. 
avendo 48000 samples che definiscono un secondo, 
in 48000 samples 500 ci stanno 96 volte
creando dunque 96Hz di frequenza (96 oscillazioni al secondo),

process infine, 
è la funzione finale e dice che il nostro fasore che si muove ora tra 0. e 1. 
con - 0.5, si muove tra - 0.5 e +0.5, 
e moltiplicando *2, si muove tra -1. e 1.
dunque process = (fasore-0.5)*2;
viene effettuato il riscalamento perchè 
essendo il fasore solo in fase positiva potrebbe creare problemi ai coni.
degli altoparlanti */

//CODICE:
decimale(x)= x-int(x);
phase = 0.002 : (+ : decimale) ~ _;
process = (phase);
