/* -------------------------------------------------------------- 80 caratteri -
-------- 0.72- GUI SINTESI ADDITIVA-------------------------------------------*/

//Importo la libreria
import("stdfaust.lib");
//dichiaro 2PI
due_pigreco = 6.2831853071795;

//creo una funzione che sottragga i numeri interi lasciando i decimali
decimale(x) = x-int(x);

//uso un argomento alla funzione per stabilire la frequenza nel process
//e uso un secondo argomento per stabilire l'ampiezza

frequenza = hslider("frequenza sinusoidi", 20, 20, 1000, 1);
ampiezza = hslider("ampiezza sinusoidi", 0, 0, 1, 0.01);

//creo i vari oscillatori sinusoidali
//con frequenza globale in rapporto armonico e ampiezza globale
osc_1 = sin((frequenza*1    
                        /ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *
            ampiezza*0.500;

osc_2 = sin((frequenza*2
                        /ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *
            ampiezza*0.250;

osc_3 = sin((frequenza*3
                        /ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *
            ampiezza*0.125;

osc_4 = sin((frequenza*4
                        /ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *
            ampiezza*0.125;
            

// somma dei vari oscillatori generati con i relativi argomenti alla funzione
   	// per ognuno: (frequenza, ampiezza)
	out_osc = osc_1 + osc_2 + osc_3 + osc_4;

// uscita del segnale stereofonica
process = out_osc, out_osc;