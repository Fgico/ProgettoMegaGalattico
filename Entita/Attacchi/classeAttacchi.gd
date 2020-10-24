extends Area

class_name Attacco

var danno = 0
var element

var mpCost = 0
var timeout = 0.5

onready var icon = Sprite.new()

#distrugge l'attacco dopo un po' dalla sua creazione
func _process(delta):
	if(timeout<0):
		self.queue_free()
	else:
		timeout -= delta
	pass

#cosa fare quando attacco colpisce qualcosa
func hit(body):
	if(body.is_in_group("enemy")):
		body.hit(danno,element)
	pass 
