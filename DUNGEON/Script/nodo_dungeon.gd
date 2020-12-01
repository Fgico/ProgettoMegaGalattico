extends Spatial

var pianoAttuale = 0
var piani = []

func cambioPiano(nuovoLivello):
	pianoAttuale += 1 #pianoAttuale è un contatore
	var newPiano = load(nuovoLivello)
	get_node("Dun1_player").queue_free()
	var pianoCreato = newPiano.instance() #creo il nuovo piano
	self.add_child(pianoCreato)
	get_node("player/target/Camera").current = true
	
	#mostra comandi UI
	get_node("player").UI.show()

