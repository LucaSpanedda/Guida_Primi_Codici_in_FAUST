/* -------------------------------------------------------------- 80 caratteri -
-------- 0.70- SINTESI ADDITIVA-----------------------------------------------*/

//4 Oscillatori sinusoidali in sintesi additiva

//Importo la libreria
import("stdfaust.lib");
//dichiaro 2PI
due_pigreco = 6.2831853071795;

//creo una funzione che sottragga i numeri interi lasciando i decimali
decimale(x) = x-int(x);

//uso un argomento alla funzione per stabilire la frequenza nel process
//e uso un secondo argomento per stabilire l'ampiezza
//e creo i vari oscillatori sinusoidali
osc_1(frequenza_1, ampiezza_1) = sin((frequenza_1/ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *ampiezza_1;

osc_2(frequenza_2, ampiezza_2) = sin((frequenza_2/ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *ampiezza_2;

osc_3(frequenza_3, ampiezza_3) = sin((frequenza_3/ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *ampiezza_3;

osc_4(frequenza_4, ampiezza_4) = sin((frequenza_4/ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *ampiezza_4;
            

// somma dei vari oscillatori generati con i relativi argomenti alla funzione
    // per ognuno: (frequenza, ampiezza)
out_osc = (osc_1(300.5, 0.500) + osc_2(450, 0.250) 
        + osc_3(500, 0.125) + osc_4(600, 0.060))
            * hslider("ampiezza sinusoidi", 0, 0, 1, 0.01);
            //controllo ampiezza globale degli oscillatori


// uscita del segnale stereofonica
process = out_osc, out_osc;