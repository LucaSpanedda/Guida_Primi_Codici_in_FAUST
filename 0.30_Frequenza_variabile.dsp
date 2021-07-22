// FREQUENZA VARIABILE 

/* Nella nostra definizione del fasore,
sappiamo che la nostra frequenza è definita
dal valore che definisce gli step d'incremento per ogni campione.
ad esempio:
ad una frequenza di campionamento (fissa), 
per l'appunto di 48000samples al secondo,
sappiamo che se impiegassimo un valore incrementale piccolo, 
che impiegasse 48000 STEP
successivi per arrivare dal numero 0. al numero 1. per poi resettarsi,
avremmo dunque 1 sola oscilazione per ogni secondo,
essendo il nostro secondo definito da 48000 campioni.
se avessimo invece un passo incrementale che impiegasse solo la metà
dei nostri 48000 campioni (e dunque 24000) per arrivare da 0. a 1.
per poi resettarsi,
avremo invece due oscillazioni al secondo
e così via.

quindi se volessimo controllare la frequenza del nostro fasore,
abbiamo bisogno di conoscere la frequenza di campionamento.
e dire che: 
la frequenza che vogliamo per il fasore/ frequenza di campionamento.
dandoci come risultato quello STEP INCREMENTALE
che ci permette di arrivare da 0. a 1. risettandosi  
tante volte quante quelle determinate dalla frequenza che vogliamo.

FAUST ha una sua libreria che permette di richiamare
all'interno del codice, l'attuale frequenza di campionamento.
la libreria si può richiamare così: 
import("stdfaust.lib");
e il comando per richiamare la frequenza di campionamento attuale è:
ma.SR

per definire dunque quanti Hz rispetto al sample-rate in un secondo,
vogliamo che faccia la nostra rampa,
dobbiamo definire il processo così:

frequenza = 400;
fasore = (frequenza/ma.SR) : (+ : decimale) ~ _; */


//CODICE:
import("stdfaust.lib");
decimale(step)= step-int(step);
frequenza = 440;
fasore = (frequenza/ma.SR) : (+ : decimale) ~ _;

riscalamento_fasi = fasore-0.5;
//il -0.5 serve per non creare un out solo positivo.

ampiezza_fasore = 1;
//controllo ampiezza

process = ampiezza_fasore, ampiezza_fasore; 

//abbiamo quindi in uscita due fasori in parallelo 
per la stessa frequenza precedentemente determinata.
