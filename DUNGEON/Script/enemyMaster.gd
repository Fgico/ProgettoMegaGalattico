extends Node

onready var player = get_parent().get_parent().get_parent().get_node("player")
onready var nav = get_node("Navigation")

var step = 1
var pos = 0
var cycleStart = 0
var framesAvailable = 30

var figli = []

func _ready():
	pass



func _process(delta):
	step = int(ceil(figli.size() / framesAvailable))
	if(figli != null):
		if(pos > 0 and pos % step == 0):
			cycleStart = pos
		while (pos < (cycleStart + step)) and pos < figli.size():
			if figli[pos] != null :
				var from = nav.get_closest_point(figli[pos].global_transform.origin)
				var to = nav.get_closest_point(player.global_transform.origin)
				var path = nav.get_simple_path(from,to)
				figli[pos].path = path
				print(figli[pos])
				print(path)
				print(pos)
			pos +=1

