extends Spatial

onready var pianoAttuale = get_node("Isola_volante")
onready var player = get_node("player")

onready var musicaCitta = get_node("musicaCitta")
onready var musicaDun = get_node("musicaDun")

func _ready():
	pass # Replace with function body.


func cambioPiano(nuovoLivello):
	var newPiano = load(nuovoLivello)
	pianoAttuale.queue_free()
	var pianoCreato = newPiano.instance() #creo il nuovo piano
	self.add_child(pianoCreato)
	if(nuovoLivello == "res://Isola/ISOLA_VOLANTE/Isola_volante.tscn"):
		musicaCitta.playing = true
		musicaDun.playing = false
	else:
		musicaCitta.playing = false
		musicaDun.playing = true
	pianoAttuale = pianoCreato
	get_node("player/target/Camera").current = true
	userData.saveToFile()
	
	#aggiorno posizione player per ogni dungeon
	if( pianoAttuale.get_node("startPos") != null):
		var startPos = pianoAttuale.get_node("startPos")
		player.global_transform.origin = startPos.global_transform.origin
	
	#mostra comandi UI
	player.UI.show()
