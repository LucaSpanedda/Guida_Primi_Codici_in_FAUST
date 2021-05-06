// LA FUNZIONE CON WITH

//Importo la libreria standard di FAUST
import("stdfaust.lib");

// Una Funzione contiene le istruzioni che specificano
// le operazioni da effettuare al suo interno.
// In FAUST una funzione può essere creata specificando
// un nome da dare alle istruzioni che seguono, 
// e scrivendo nel caso in cui sia necessario,
// una lista di argomenti tra le parantesi tonda (),

// ad esempio:
// nome_funzione(argomento_1, argomento_2)

// a seguito della funzione
// bisogna eseguire un uguale che indica
// quale variabile contenuta nella funzione rappresenta
// la funzione stessa, senza ;

// ad esempio:
// nome_funzione(argomento_1, argomento_2) = argomento_1+argomento_2;

// infine le istruzioni di una funzione possono venire
// racchiuse tra due parentesi graffa,
// e nella parentesi in apertura il with,
// with{};

// ad esempio:
// nome_funzione(argomento_1, argomento_2) = variabile_1
// with{
// variabile_1 = argomento_1*10 + argomento_2*20;
// };

// il process è seguito della funzione
// per determinare quale funzione è in uscita,

// ad esempio:
// process = nome_funzione(100, 20);
// dove 100, e 20, assumono il ruolo di argomento_1 e 2.

// utilizziamo ora una funzione per creare un segnale rampa,
// con un controllo della frequenza e dell'ampiezza
// in uscita.

// Funzione osc1 con 2 argomenti.
// Richiama la variabile della funzione: fasore_out.
osc1(frequency, amplitude) = fasore_out 
with{
    // decimale e argomento step, (reset intero).
    decimale(step)= step-int(step);
    // genero il fasore utilizzando il reset int,
    // e impostando un loop.
    // Uso la prima variabile frequency 
    // per cambiare il periodo del fasore.
    fasore = (frequency/ma.SR) : (+ : decimale) ~ _;
    // sposto l'adc offset: il mio fasore era da +0. a +1,
    // ora è da -0.5 a +0.5.
    riscalamento_fasi = fasore-0.5;
    // uso la variabile 2 per definire l'ampiezza.
    // fasore out è la mia variabile richiamata dalla funzione,
    // è dunque ciò che la funzione esegue.
    fasore_out = amplitude * riscalamento_fasi;
};

// infine il process con in uscita la funzione
// e i suoi argomenti (frequenza, e ampiezza)
process = osc1(200, 1.), osc1(301, 1.); 
