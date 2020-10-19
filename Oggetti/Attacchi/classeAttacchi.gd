extends Area

class_name Attacco

var danno = 0
var element

var mpCost = 0
var timeout = 0.5

func _init():
	print("nato")
	pass
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timeout<0):
		self.queue_free()
	else:
		timeout -= delta
	pass


func hit(body):
	if(body.is_in_group("enemy")):
		body.hit(danno,element)
	print("tocc")
	pass # Replace with function body.
