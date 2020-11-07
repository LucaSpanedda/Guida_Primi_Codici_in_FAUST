// OVERDRIVE 

//Importo la libreria
import("stdfaust.lib");

//slider che incrementa l'ampiezza di un segnale
//da 1 a 100
clippingslider = hslider("distorsione", 1, 1, 1000, 1);
//minimo e massimo: -1. e 1., tutto il segnale sopra 
//entra in clipping.
//Dunque più amplifico più le soglie entrano in clipping
overdrive = _ *clippingslider : min(1) : max(-1);

//out
process = overdrive, overdrive;
