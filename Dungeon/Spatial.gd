extends Spatial


func _ready():
	pass
	

func _process(delta):
	#CREO LA MATRICE DELLA MAPPA: 0=TUNNEL, 1=MURI
	var map = [[1,1,1,1,0],
			  [1,0,0,0,0],
			  [1,0,1,1,1],       
			  [1,0,0,0,1],       
			  [1,1,1,0,1]]

#FUNZIONE CHE PRENDE UN NUMERO E UNA DIMENSIONE E CI RITORNA UN ARRAY BIDIMENSIONALE
func createArray(num, dimensions):
	var array = []; 
	
	for i in dimensions: 
		array.push([])
		for j in dimensions:  
		 array[i].push(num)    

	return array  


#SETTARE DIMENSIONE DELL’ARRAY(altezza e larghezza), IL MAXTUNNELS E IL MAXLENGHT
func createMap():
	var dimensions = 5 
	var maxTunnels = 3
	var maxLength = 3
	
	#CREARE ARRAY BIDIMENSIONALE USANDO LA FUNZIONE PREDEFINITA
	var map = createArray(1, dimensions)
	
	#CREARE E SETTARE COLONNE E RIGHE RANDOMICHE PER CREARE UN PUNTO DI INIZIO RANDOMICO
	var currentRow = floor(randi() * dimensions)      
	var currentColumn = floor(randi() * dimensions)
	
	#SETTARE LA DIREZIONE: AGGIUNGERE O TOGLIERE 1 IN BASE A DOVE SI VUOLE ANDARE (up, down, right, left)
	var directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
	
	
#INIZIALIZZARE LA VARIABILE randomDirection PER CONTENERE UN VALORE RANDOMICO DA directions DELL’ARRAY. 
#SETTARE LA VARIABILE lastDirection A UN ARRAY VUOTO CHE CONTERRÀ IL VALORE PIÙ VECCHIO DI randomDirection
	var lastDirection = []
	var randomDirection
	
#IL LOOP FA IN MODO CHE NON SI CREI UN PERCORSO UGUALE O CONTRARIO AL PRECEDENTE
#QUINDI L’ALGORITMO TORNERÀ INDIETRO A CERCARE UN ALTRO randomDirection
	randomDirection = directions[floor(randi() * directions.length)]
	while true:
		randomDirection = directions[floor(randi() * directions.length)]      
		if ((randomDirection[0] != -lastDirection[0] && 
		randomDirection[1] != -lastDirection[1]) || 
		(randomDirection[0] != lastDirection[0] && 
		randomDirection[1] != lastDirection[1])):
			break
	
	
#SE LE CONDIZIONI DEL randomDirection SONO SODDISFATTE, SI PROCEDERÀ A SETTARE UNA LUNGHEZZA RANDOMICA 
#DA maxLength E AD IMPOSTARE LA VARIABILE tunnelLength A ZERO PER USARLA COME ITERATORE
	var randomLength = ceil(randi() * maxLength)
	var tunnelLength = 0
	
	
#SE ALL’INTERNO DEL LOOP IL TUNNEL TOCCA I CONFINI DELLA MAPPA, IL LOOP SI FERMA 
	
	while (tunnelLength < randomLength):
		
		if(((currentRow == 0) && (randomDirection[0] == -1)) ||  
		((currentColumn == 0) && (randomDirection[1] == -1)) || 
		((currentRow == dimensions - 1) && (randomDirection[0] == 1)) ||
		((currentColumn == dimensions - 1) && (randomDirection[1] == 1))):
			break
		
		#ALTRIMENTI IMPOSTA SU ZERO LA CELLA CORRENTE DELLA MAPPA USANDO currentRow E currentColumn.
		#AGGIUNGO I VALORI NELL’ARRAY randomDirection IMPOSTANDO currentRow E currentColumn
		#DOVE DEVONO ESSERE NELL’ITERAZIONE IMMINENTE DEL LOOP E INCREMENTA L’ITERATORE tunnelLength
		else:
			map[currentRow][currentColumn] = 0
			currentRow += randomDirection[0]
			currentColumn += randomDirection[1] 
			tunnelLength = tunnelLength + 1
			
	
#SE IL TUNNEL È LUNGO ALMENO UN BLOCCO, METTO randomDirection IN lastDirection E DECREMENTO maxTunnels
#E TORNO INDIETRO A CREARE UN ALTRO TUNNEL CON UN ALTRO randomDirection
	if (tunnelLength): 
		lastDirection = randomDirection; 
		maxTunnels = maxTunnels - 1
	
#QUANDO maxTunnels È A ZERO E I TUNNEL FINISCONO DI ESSERE DISEGNATI, RITORNA IL RISULTATO DELLA MAPPA
	return map


