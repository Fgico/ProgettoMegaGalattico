extends Spatial

var pianoAttuale = 0
var piani = [
	"res://Dungeons/Modular Dungeon/dung1.meshlib"
	,"res://Dungeons/Modular Dungeon/dung1.meshlib",
	"res://Isola/Isola_volante_presentazione.tscn"
]

func cambiapiano():
	pianoAttuale += 1
	var newPiano = load(piani[pianoAttuale])
	get_node("Spatial").queue_free()
	var pianoCreato = newPiano.instance()
	self.add_child(pianoCreato)
