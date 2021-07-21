// SINTESI ADDITIVA FORME D'ONDA ELEMENTARI

// Importo la libreria
import("stdfaust.lib");
//dichiaro 2PI
due_pigreco = 6.2831853071795;

// Generazione oscillatore sinusoidale:
// creo una funzione che sottragga i numeri interi lasciando i decimali
decimale(x) = x-int(x);
// uso un argomento alla funzione per stabilire la frequenza nel process
// e uso un secondo argomento per stabilire l'ampiezza
// e creo la funzione dell'oscillatore sinusoidale
osc(frequenza, ampiezza) = sin((frequenza/ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *ampiezza;
            
// Generazione delle forme d'onda elementari 
// a partire dalla sintesi additiva.
// definisco due funzioni: una per la frequenza fondamentale
// ed una per l'ampiezza fondamentale:
// COSTANTI OSCILLATORI
f = 200;
a = 0.5;

// applico poi le formule per ricavare le differenti parziali
// che designano il timbro della mia forma d'onda:

// SINUSOIDE

sine =  
    osc(f,a);

// QUADRA

/* A square wave takes a few more added harmonics to get close 
to its ideal mathematical shape. This waveform is created also 
using only the odd-numbered harmonics (1, 3, 5, 9...), and zero 
is also used for the amplitude of the even 
harmonics (2, 4, 6, 8...). Then 1 is divided by the number of the 
harmonic to get its amplitude (i.e. 1/h). As illustrated below, 
a square wave made up of only four harmonics isn't very square, 
but when more harmonics are added its shape becomes very clear.*/
square =
    osc(f,a) +
    osc(f*3,a/3) +
    osc(f*5,a/5) +
    osc(f*7,a/7) + 
    osc(f*9,a/9) +
    osc(f*11,a/11) +
    osc(f*13,a/13) +
    osc(f*15,a/15) +
    osc(f*17,a/17) +
    osc(f*19,a/19) +
    osc(f*21,a/21) +
    osc(f*23,a/23) +
    osc(f*25,a/25) +
    osc(f*27,a/27) +
    osc(f*29,a/29) +
    osc(f*31,a/31) ;

// TRIANGOLARE

/* A triangle wave can also be quite simply generated with only 
a few harmonics. 
The shape of a triangle wave is made using only the odd harmonics 
(1, 3, 5, 7, etc). Zeros are used for the amplitude 
of the even harmonics (2, 4, 6, 8, etc). 
Then 1 is divided by the square of each of those harmonics 
(i.e. 1/h2). Finally, the amplitude of every other harmonic 
is multiplied by -1 (i.e. the amplitudes of 
the third, seventh, ninth, etc harmonics). 
The triangle wave takes shape very quickly with only four harmonics, 
and as more harmonics are added, 
the points of the triangle become sharper. */
triangle =
    osc(f,a) +
    osc(f*3,a*-0.111111) +
    osc(f*5,a*0.04) +
    osc(f*7,a*-0.0204082) + 
    osc(f*9,a*0.0123457) +
    osc(f*11,a*-0.00826446) ;

// DENTE DI SEGA

/* A sawtooth wave is the simplest, as it uses the formula 1/h 
(where "h" indicates the number of the harmonic) to compute 
the amplitudes. Therefore, the amplitude of the first harmonic 
is 1/1 = 1, the second is 1/2 = 0.5, the third 
is 1/3 = 0.33333, etc etc. */
saw =
    osc(f,a) +
    osc(f*2,a/2) +
    osc(f*3,a/3) +
    osc(f*4,a/4) + 
    osc(f*5,a/5) +
    osc(f*6,a/6) +
    osc(f*7,a/7) +
    osc(f*8,a/8) +
    osc(f*9,a/9) +
    osc(f*10,a/10) +
    osc(f*11,a/11) +
    osc(f*12,a/12) +
    osc(f*13,a/13) +
    osc(f*14,a/14) +
    osc(f*15,a/15) +
    osc(f*16,a/16) ;

// Uscita del segnale con il process:
process = saw;
