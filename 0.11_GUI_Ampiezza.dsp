// GUI

// importo del rumore bianco come sorgente da controllare
import("stdfaust.lib");
noise = no.noise;

/*
In FAUST è possibile creare delle interfacce
per il controllo visuale all'interno del proprio codice.
Sono presenti varie categorie di oggetti. 
*/

// ad esempio il gate è un semplice tasto ON/OFF
// input moltiplicati per il gate di segnale (0. e 1.)
    // process = noise*button("[1]gate segnale");


/* In questo esempio useremo degli slider orizzontali
Per il controllo dell'ampiezza dei nostri due oscillatori.
per assegnare uno slider per il controllo visuale di un parametro,
bisogna richiamarlo tramite il suo comando: hslider. 
Dunque: */

    // process = noise* hslider("ampiezza noise 1",0,0,1, 0.01), 
    // noise* hslider("ampiezza noise 2",0,0,1, 0.01);

// Quando viene richiamato un controllo grafico 
// la disposizione del suo codice è la seguente:
// oggetto("nome visualizzazione", val.partenza, val.min, val.max, step tra min.max.)

/*Gli oggetti grafici sono divisi in due macrocategorie:
hslider - SLIDER ORIZZONTALE
vslider - SLIDER VERTICALE
di questi si può definire lo stile:
[style:slider] se si vuole un controllo SLIDER
[style:knob] se si vuole un controllo KNOB
Li utilizzeremo ora come KNOB*/

process = 
    noise* hslider("Ampiezza knob [style:knob]",0,0,1, 0.01);
