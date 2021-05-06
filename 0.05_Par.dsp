// IL PAR

//Importo la libreria standard di FAUST
import("stdfaust.lib");

// OSCILLATORE SAW (ARGOMENTO DA RICHIAMARE NEL PAR)
decimale(x) = x-int(x);
saw(frequenza) = ((frequenza/ma.SR : (+ : decimale)~_)*2-1);


/* in faust l'ietrazione PAR può essere usata per duplicare 
le espressioni in parallelo

- il primo argomento è la variabile che deve essere richiamata
in seguito per designare le iterazioni
starting at 0.

- il secondo argomento è il numero delle iterazioni necessario
( nell'ide web se ne possono utilizzare max. 32)

- il terzo argomento è la funzione che deve essere duplicata
( con la variabile e il disegno dello step incrementale)
*/

// in questo caso la variabile di saw è 100,
// e gli incrementi sono lasciati per default a 1 (i).
// se moltiplicassi ad esempio il mio (i*100) 
// otterrei uno step incrementale di 100 per ogni copia della funzione
iteration = par(i,8,saw(100+i)) :> *(0.1);
process = iteration <: _,_;
