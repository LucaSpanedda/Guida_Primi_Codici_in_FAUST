// LINEE DI RITARDO 

/*Le linee di ritardo in Faust 
si suddividono nelle seguenti categorie:

mem - indica un solo campione di ritardo
@ - indica un numero (ex. 44100) di campioni di ritardo variabile
x'- x indica un qualsiasi ingresso e: ' un campione di ritardo, ''(2), ecc.
rdtable - indica una tabella di sola lettura
rwtable - indica una tabella di scrittura e lettura
*/


//Importo la libreria
import("stdfaust.lib");

//possiamo creare un impulso di Dirac, che rappresenta 
//la nostra unità minima, ovvero il singolo campione
//mettendo un numero 1 e sottraendo da esso lo stesso valore
//ma facendolo ad un campione di ritardo. Così facendo
//potremo udire un valore 1 della durata di un singolo campione
//all'avvio del programma.

//Impulso
dirac = 1-1';

//Process
process = dirac, dirac;
