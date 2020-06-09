/* -------------------------------------------------------------- 80 caratteri -
-------- 0.5- GUI FREQUENZA ----------------------------------------------------

Gli oggetti grafici sono divisi in due macrocategorie:
hslider - SLIDER ORIZZONTALE
vslider - SLIDER VERTICALE

di questi si può definire lo stile:
[style:slider] se si vuole un controllo SLIDER
[style:knob] se si vuole un controllo KNOB

Li utilizzeremo ora come KNOB per controllare Ampiezza e Frequenza
dei due oscillatori. */


import("stdfaust.lib");
decimale(x) = x-int(x);
phase(f) = f/ma.SR : (+ : decimale) ~ _;
saw(f) = (phase(f) *2-1)* 1; 

process = 

    // saw è l'oscillatore 1, seguito dal controllo in frequenza.
    saw(1* hslider("Frequenza SAW 1 [style:knob]",20,20,1000, 0.01))
    //  1* definisce la frequenza, moltiplicato per il controllo a knob grafico
    * hslider("Ampiezza SAW 1 [style:knob]",0,0,1, 0.01)
    // moltiplicato alla fine, dopo le parentesi per il controllo ampiezza grafico
        , // virgola per aprire un processo in parallelo

    // saw è l'oscillatore 2, seguito dal controllo in frequenza.
    saw(1* hslider("Frequenza SAW 2 [style:knob]",20,20,1000, 0.01))
    //  1* definisce la frequenza, moltiplicato per il controllo a knob grafico
    * hslider("Ampiezza SAW 2 [style:knob]",0,0,1, 0.01)
    // moltiplicato alla fine, dopo le parentesi per il controllo ampiezza grafico
        ; // chiude il processo
