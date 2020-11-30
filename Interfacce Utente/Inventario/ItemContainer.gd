extends Control

var child

#memorizza la posizione nell'inventario a cui si riferisce il container
var slotNumber  
#costanti per numeroSlot che specificano se è lo slot dell'arma o armatura equipaggiata
const Weapon = -1
const BodyArmor = -2

onready var pos = $slot
var hasArea = false

func getPos():
	return pos.global_position
	
func _on_Area2D_area_entered(area):
	area.get_parent().parent = self
	hasArea =true
	pass # Replace with function body.



func _on_Area2D_area_exited(area):
	hasArea = false
	pass # Replace with function body.
