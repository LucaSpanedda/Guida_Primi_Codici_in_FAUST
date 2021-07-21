// FONDAMENTI DI FAUST

// --- LA RIGA DI COMMENTO
// la sintassi di Faust proviene dal linguaggio c quindi in Faust la riga di
// commento si scrive con un doppio-slash ad inizio riga // come fatto finora.

// --- IL COMMENTO MULTI RIGA
/* come nel linguaggio c si può iniziare un commento multiriga con i caratteri
slash asterisco ad inizio commento e asterisco slash a fine commento come fatto
in questo blocco di codice. */

// --- FUNZIONE
// una funzione è una parte del programma che permette di raggruppare, una
// sequenza di istruzioni in un unico blocco, espletando così una specifica
// (e in generale più complessa) operazione, azione (o elaborazione) sui dati
// del programma stesso in modo tale che, a partire da determinati INPUT,
// restituisca determinati OUTPUT.
// L'importanza, la praticità e i vantaggi di una funzione stanno nel fatto che
// può essere "chiamata" ("richiamata", "invocata" o "attivata") in diversi
// punti del programma di cui fa parte ogni volta in cui si ha la necessità di
// farlo come se fosse una singola istruzione senza la necessità di doverne
// riscrivere ogni volta il relativo codice implementando dunque il cosiddetto
// riuso di codice.

process = _;

// --- PROCESS
// process è il luogo in cui il programma di Faust diviene attivo, le funzioni
// esterne a process diventano attive solo se chiamate direttamente o
// indirettamente nella riga di process. process è assimilabile al ciclo main
// del linguaggio c.
// l'operatore _ indica un rapporto di identità tra entrata ed uscita,
// astrazione del canale di transito del segnale. 

// --- OPERATORI MATEMATICI
// gli operatori matematici sono + - * / % ^ ognuno dei quali ha due entrate
// implicite ed una sola uscita: esempio A + B dove A e B sono le entrate della
// dell'oeratore somma producono una sola uscita C. process = A+B; process = C;

// --- OPERATORI COMPOSITIVI
// il linguaggio di faust è algebrico con logica a blocchi: si scrivono
// espressioni come astrazioni di diagramma a blocchi sulla base di cinque
// operatori per la composizione dei flussi audio
//
// : collegamento sequenziale
// (esempio A : B dove l'usicita di A entra nella sola entrata di B)
// --> A --> B -->
//
// , percorso parallelo
// (esempio A, B dove i flussi di A e di B sono paralleli)
// --> A -->
// --> B -->
//
// <: split del percorso in n uscite
// (esempio A <: B,C dove l'uscita di A entra in B e in C)
//          |--> B -->
// --> A --<:
//          |--> C -->
//
// :> unione combinata di più percorsi in entrata su una o più uscite
// (esempio A,B :> C dove i flussi di A e B sono paralleli e convergono in C)
// --> A -->|
//          :>--> C -->
// --> B -->|
//
// ~ collegamento ricorsivo
// (esempio A~B dove l'uscita di A viene collegata all'entrata di B e
// l'uscita di B viene collegata all'entrata di A)
// (esempio di A con una sola entrata, questa verrà occupata dall'uscita di B).
// +-- B <--+
// |        |
// +--> A --+-->
// (esempio di A con due entrate, l'uscita B occuperà la prima entrata di A)
//   +-- B <--+
//   |        |
// --+--> A --+-->
//
// ! interruzione di percorso
// (esempio A:! l'uscita di A viene chiusa)

// --- OPERATORI LOGICI (BITWISE)
// & and
// | or
// xor
// << shift left
// << shift right

// --- OPERATORI DI CONFRONTO
// < minore
// <= minore uguale
// > maggiore
// >= maggiore uguale
// == uguale
// != diverso

// --- OPERATORI DI RITARDO
// @ ha due entrate, il segnale da ritardare e la quantità del ritardo.
// mem ritardo di un campione
// ' numero di campioni di ritardo x'' (x due campioni dopo)

// --- FUNZIONI MATEMATICHE PRIMITIVE
// acos asin atan atan2 cos sin tan exp log log10 pow sqrt abs min max fmod
// remainder floor ceil rint
