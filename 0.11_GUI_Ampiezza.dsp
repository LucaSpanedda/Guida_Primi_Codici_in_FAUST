// GUI AMPIEZZA

In FAUST è possibile creare delle interfacce
per il controllo visuale all'interno del proprio codice.

Sono presenti varie categorie di oggetti,
In questo esempio useremo degli slider orizzontali
Per il controllo dell'ampiezza dei nostri due oscillatori. */

// importo del rumore bianco come sorgente per controllare l'ampiezza
import("stdfaust.lib");
noise = no.noise;

/* per assegnare uno slider per il controllo visuale di un parametro,
bisogna richiamarlo tramite il suo comando: hslider. 
Dunque: */
process = 
    noise* hslider("ampiezza noise 1",0,0,1, 0.01), 
    noise* hslider("ampiezza noise 2",0,0,1, 0.01);

// Quando viene richiamato un controllo grafico 
// la disposizione del suo codice è la seguente:
// oggetto("nome visualizzazione", val.partenza, val.min, val.max, step tra min.max.)
