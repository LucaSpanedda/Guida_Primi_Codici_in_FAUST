// FASORE GLITCH

//Importo la libreria
import("stdfaust.lib");

/* Ora che abbiamo parlato molto della generazione di segnali
raccogliamo i dati esposti fino ad ora per generare un segnale
non convenzionale: un Fasore con dei Glitch interni controllati */


// Noise generation - (define seed)
noise(seed) = (+(seed)~*(1103515245))/2147483647.0;
// Remove int
decimale(x) = x-int(x);
// Standard phasor (with remove int)
phasor(f) = (f/ma.SR) : (+ : decimale) ~ _;
// only if phasor < 0.5 = 1 (when phasor end) then impulse
phasorif(f) = phasor(f) < 0.5;
        impulse(sampsdel) = _ <: _, _@(sampsdel) :> - ;

// regular impulse based on phasor * noise
noisepulse(f,seed,sampsdel,pulseamp) = 
        ((phasorif(f) : impulse(sampsdel)) * noise(seed))*pulseamp;

// SCATTERING PHASOR
// regular impulse + 1 on the retroaction generate scatter
glitchphasor(fphasor,fscatter,sampsdel,pulseamp,seed) = 
    (fphasor/ma.SR) : 
        ( + : _ * 
            (1-noisepulse(fscatter,seed,sampsdel,pulseamp)) : decimale
        )~ _ ;

// glitchphasor(fphasor,fscatter,sampsdel,pulseamp,seed)
process = 
        glitchphasor(2000,4,1,1,12462218)-0.5,
        glitchphasor(2000,4,1,1,24654216)-0.5;
