// CONDIZIONI SU UN SEGNALE

/* In FAUST possiamo utilizzare dei Breakpoint 
sul percorso del segnale per l'elaborazione,
e per determinare delle particolari condizioni. 

In questo caso utilizzeremo i valori 
di minimo e massimo per impostare un limite 
oltre il quale il segnale diventa costante rispetto 
a quella soglia di valore */

//Importo la libreria
import("stdfaust.lib");

// tutto il segnale sopra la soglia entra in clipping 
// e viene dunque tagliato.
// (a) determina il livello di amplificazione dell'ingresso
// (v) determina la soglia minima e massima
clipz(a,v) = _*a : min(v) : max(-v);

// Generazione oscillatore sinusoidale:
due_pigreco = 6.2831853071795;
decimale(x) = x-int(x);
osc(frequenza,ampiezza) = sin((frequenza/ma.SR : (+ : decimale) ~ _ ) 
                                    *due_pigreco) *ampiezza;
sine = osc(200,1);   

// Uscita del segnale con il process: sine --> clipz
// clipz <: _,_; verso i due primi canali di out: 1,2;
process = sine : clipz(1,0.5) <: _,_;
