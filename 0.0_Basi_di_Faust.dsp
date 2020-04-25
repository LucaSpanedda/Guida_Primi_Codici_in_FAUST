// FONDAMENTI DI FAUST

// COMMENTO
// molto della sintassi di Faust proviene dal linguaggio c
// i commenti seguono per commentare si usa un doppio slash //
// si usa per ogni riga interessata in cui deve essere inserito il commento.


// FUNZIONE e FUNZIONE MAIN 
// Una funzione in informatica, permette di raggruppare, all'interno di un programma, una 
// sequenza di istruzioni in un unico blocco, espletando così una specifica (e in generale più 
// complessa) operazione, azione (o elaborazione) sui dati del programma stesso in modo tale che, 
// a partire da determinati INPUT, restituisca determinati OUTPUT.
// L'importanza, la praticità e i vantaggi di una funzione stanno nel fatto che può essere "chiamata" ("richiamata", "invocata" o "attivata") 
// in diversi punti del programma di cui fa parte ogni volta in cui si ha la necessità di farlo 
// come se fosse una singola istruzione senza la necessità di doverne riscrivere ogni volta il 
// relativo codice implementando dunque il cosiddetto riuso di codice.

// Process:
// process è il ciclo main di faust, la funzione main di un programma è uguale a
// tutte le altre funzioni, tranne che ha un nome convenzionale fissato e è la funzione invocata 
// per far partire il programma.


// OPERAZIONI
// Le operazioni principali in FAUST sono:
// Arithmetica: +, -,*, /,. . .
// Comparazione: <, <=,!=,. . .
// Trigonometria: sin, cos,. . .
// Logaritmi and Co.: log, exp,. . .
// Minimo e Massimo: min, max,. . .
// Selettori: select2,. . .
// Ritardi e Tavole: @,. . .
// GUI (interfaccia grafica per utente): button("..."),. . .


// SINTASSI
// La sintassi di FAUST è basata su l'algebra di diagrammi a blocchi
// (A,B) operazione parallela - A e B sono paralleli verticalmente, hanno due uscite indipendenti - esempio: (10,*)
// (A:B) operazione sequenziale - connette l'uscita di A all'input di B - esempio: ((*,/):+)
// (A<:B) operazione divisa - è usata per distribuire L'OUTPUT di A ai VARI INPUT di B - esempio: ((10,20) <: (+,*,/))
// (A<:B) operazione unita - è usata per connettere I VARI OUTPUT di A ad UN SOLO INPUT di B - esempio: ((10,20,30,40) :> *)
// (A~B) operazione ricorsiva - è usata per creare FEEDBACK (rientri) di un operazione rendendola CICLICA - esempio: +(12345) ~ *(1103515245)


// COSTANTI
// ! taglio
// _ cavo (di collegamento)
