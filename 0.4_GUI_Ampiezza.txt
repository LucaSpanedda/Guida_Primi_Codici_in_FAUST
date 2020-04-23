// In FAUST è possibile creare delle interfacce
// per il controllo visuale all'interno del proprio codice.

// Sono presenti varie categorie di oggetti,
// In questo esempio useremo degli slider orizzontali
// Per il controllo dell'ampiezza dei nostri due oscillatori.


import("stdfaust.lib");
decimale(x) = x-int(x);
phase(f) = f/ma.SR : (+ : decimale) ~ _;
saw(f) = (phase(f) *2-1)* 1; 

// per assegnare uno slider per il controllo visuale
// di un parametro,
// bisogna richiamarlo tramite il suo comando: hslider.

process = 
    saw(1000)* hslider("ampiezza saw 1",0,0,1, 0.01), 
    saw(1010)* hslider("ampiezza saw 2",0,0,1, 0.01);

// Quando viene richiamato un controllo grafico 
// la disposizione del suo codice è la seguente:
// oggetto("nome visualizzazione", val.partenza, val.min, val.max, step tra min.max.)
