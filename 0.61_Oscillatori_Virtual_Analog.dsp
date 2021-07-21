// OSCILLATORI VIRTUAL ANALOG

/* Come appurato, in FAUST è possibile elaborare 
la forma d'onda di un segnale imponendo determinate 
condizioni matematiche.
Proprio come nel mondo Elettrotecnico è quindi
possibile procedere alla creazione di Oscillatori
matematici, imponendo un determinato tipo di condizioni 
di funzionamento in fase di generazione del segnale.
Gli oscillatori Virtual Analog sfruttano tutta la 
frequenza di campionamento */

//Importo la libreria standard
import("stdfaust.lib");
// genero un Fasore:
decimale(x) = x-int(x);
phase(f) = f/ma.SR : (+ : decimale) ~ _;


// ONDA TRIANGOLARE
// A Partire dal Fasore generato:
// Il fasore si muove tra i valori di 0. e 1.
// sottraendo 0.5 si muoverà tra -0.5 e +0.5.
scale_phasortr(f) = phase(f) - 0.5;
// con < 0. Passa della rampa solo il segnale minore di 0.5
// Ma mantenendo la sua curva originale grazie alla moltiplicazione
negative_parttr(f) = (scale_phasortr(f) < 0) * scale_phasortr(f);
// con > 0. Passa della rampa solo il segnale maggiore di 0.5
// Ma mantenendo la sua curva originale grazie alla moltiplicazione
positive_parttr(f) = (scale_phasortr(f) > 0) * scale_phasortr(f);
// riporto in negativo la parte positiva facendo in modo che
// la seconda metà del segnale non vada da 0. a 0.5
// ma da 0. a -0.5
transposed_positivetr(f) = positive_parttr(f) * -1;
// sommo le due metà per riformare il segnale:
//la prima parte e la seconda parte transposta in negativo
full_triangletr(f) = negative_parttr(f) + transposed_positivetr(f);
// in questo momento il segnale si muoverà tra -0.5 e 0.
// dunque per rimetterlo in fase aggiungo 0.25 così da
// farlo oscillare tra -0.25 e +0.25
triangle_negativetr(f) = full_triangletr(f) + 0.25;
// Infine controllo l'ampiezza con a
tri(f,a) = triangle_negativetr(f) * a;

// DENTE DI SEGA
// Per l'onda a dente di sega basta riscalare la corsa del fasore
// *-1 inverte e +0.5 reimposta la fase eliminando l'offset
saw(f,a) = (phase(f)*-1+0.5)*a;

// ONDA QUADRA 
// A Partire dal Fasore generato imposta una condizione:
// Passa della rampa solo il segnale maggiore di 0.5 divenendo 1.
// ed il minore diventa 0.
// infine il segnale viene riscalato tra fase positiva e negativa 
// (-1. e +1.)
square(f,a) = (((phase(f) > 0.5) -0.5) *2) * a;

// Uscita del segnale con il process
process = 
    square(200,0.2)+saw(250.5,0.3)+tri(300,0.2) <:_,_;
