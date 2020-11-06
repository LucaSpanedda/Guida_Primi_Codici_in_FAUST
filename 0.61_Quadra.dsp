// ONDA QUADRA 

// Creazione di un onda quadra a partire dal fasore.
// Fasore:
import("stdfaust.lib");
decimale(x) = x-int(x);
phase(f) = f/ma.SR : (+ : decimale) ~ _;

/* A Partire dal Fasore generato:
Passa della rampa solo il segnale maggiore di 0.5 divenendo 1.
ed il minore diventa 0.
infine il segnale viene riscalato tra fase positiva e negativa 
(-1. e +1.) */

// CODICE:
saw(f) = (((phase(f) > 0.5) -0.5) *2) * 
/* in FAUST si può definire all'interno di una funzione uno o più parametri,
variabili,
definiti esternamente, come in questo caso con saw(f)
e poi inseriti all'interno della funzione.
in questo caso, come si può vedere nel process,
si parla di un controllo della frequenza dell'oscillatore. */

hslider("ampiezza fasore 1", 0, 0, 1, 0.01);
// L'ampiezza è invece controllata dallo slider.

process = 
    // le due frequenze in uscita dei/ e i due oscillatori
    saw(440), saw(441);
