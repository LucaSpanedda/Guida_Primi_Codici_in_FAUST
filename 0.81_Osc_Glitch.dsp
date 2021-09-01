// GLITCHED SINUSOIDAL OSCILLATOR

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

// GLITCHED SINUSOIDAL OSCILLATOR
due_pigreco = 6.2831853071795;
glitchsineosc(fosc,fscatter,sampsglitch,pulseamp,seed,amp) = 
amp * sin( glitchphasor(fosc,fscatter,sampsglitch,pulseamp,seed) 
* due_pigreco);

// glitchsineosc(fosc,fscatter,sampsglitch,pulseamp,seed,amp)
process = 
        glitchsineosc(800,2,10,1,1246,0.5) + 
        glitchsineosc(200,4,4,1,1446,0.5) ,
        glitchsineosc(600,2,10,1,1462,0.5) +
        glitchsineosc(300,4,4,1,1226,0.5) ;
