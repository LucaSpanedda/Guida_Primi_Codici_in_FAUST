// SINTESI ADDITIVA

/* La sintesi additiva è una tecnica di sintesi sonora 
utilizzata nella musica elettronica che crea timbriche, 
quindi forme d'onda comunque complesse, sommando insieme singole onde, 
generalmente sinusoidali.
In base alla teoria di Fourier, la forma d'onda di un segnale 
e il suo inviluppo nel tempo possono essere ottenuti matematicamente 
come combinazione di onde sinusoidali di frequenza multipla 
di una frequenza fondamentale (armoniche) e di onde sinusoidali 
parziali di frequenza, fase e ampiezza diversa che, entrambe, 
possono crescere, mantenersi e decadere nel tempo. 
Questa teoria si può applicare anche alle forme d'onda 
generate da uno strumento musicale, 
consentendo così di scomporne il timbro e 
il suono in onde sinusoidali elementari.
La sintesi additiva sfrutta esattamente questo meccanismo 
per imitare il suono di qualsiasi strumento musicale, 
sommando l'uscita di più oscillatori usati come generatori di forme d'onda, 
modulati e regolati secondo le caratteristiche 
risultanti dalla scomposizione di Fourier. 
In questo modo è possibile riprodurre la forma d'onda corrispondente 
al timbro dello specifico strumento, emulandone quindi il suono. */

// Importo la libreria
import("stdfaust.lib");
//dichiaro 2PI
due_pigreco = 6.2831853071795;

// creo una funzione che sottragga i numeri interi lasciando i decimali
decimale(x) = x-int(x);
// uso un argomento alla funzione per stabilire la frequenza nel process
// e uso un secondo argomento per stabilire l'ampiezza
// e creo i vari oscillatori sinusoidali
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
// uscita del segnale 
process = 
osc_1(300.5, 0.500) +osc_2(450, 0.250) +osc_3(500, 0.125) +osc_4(600, 0.060);
