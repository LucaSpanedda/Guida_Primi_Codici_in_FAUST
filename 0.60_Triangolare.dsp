/* -------------------------------------------------------------- 80 caratteri -
-------- 0.60- ONDA TRIANGOLARE ----------------------------------------------*/

// Creazione di un onda triangolare a partire dal fasore.
// Fasore:
import("stdfaust.lib");
decimale(x) = x-int(x);
phase(f) = f/ma.SR : (+ : decimale) ~ _;


// A Partire dal Fasore generato:
// Il fasore si muove tra i valori di 0. e 1.
// sottraendo 0.5 si muoverà tra -0.5 e +0.5.
scale_phasor(f) = phase(f) - 0.5;


// con < 0. Passa della rampa solo il segnale minore di 0.5
// Ma mantenendo la sua curva originale grazie alla moltiplicazione
negative_part(f) = (scale_phasor(f) < 0) * scale_phasor(f);

// con > 0. Passa della rampa solo il segnale maggiore di 0.5
// Ma mantenendo la sua curva originale grazie alla moltiplicazione
positive_part(f) = (scale_phasor(f) > 0) * scale_phasor(f);

// riporto in negativo la parte positiva facendo in modo che
// la seconda metà del segnale non vada da 0. a 0.5
// ma da 0. a -0.5
transposed_positive(f) = positive_part(f) * -1;

// sommo le due metà per riformare il segnale:
//la prima parte e la seconda parte transposta in negativo
full_triangle(f) = negative_part(f) + transposed_positive(f);

// in questo momento il segnale si muoverà tra -0.5 e 0.
// dunque per rimetterlo in fase aggiungo 0.25 così da
// farlo oscillare tra -0.25 e +0.25
triangle_negative(f) = full_triangle(f) + 0.25;

// Infine controllo l'ampiezza dallo slider (da 0. a +/-1.).
triangle_osc(f) = triangle_negative(f) * hslider("ampiezza triangle", 0, 0, 4, 0.01);


process = 
    // le due frequenze in uscita dei/ e i due oscillatori,
    // e l'uscita 1 e 2 dei due oscillatori.
    triangle_osc(200), triangle_osc(201);