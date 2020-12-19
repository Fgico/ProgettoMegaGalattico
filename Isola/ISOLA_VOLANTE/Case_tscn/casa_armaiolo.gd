extends Spatial

var shopUI = preload("res://Interfacce Utente/Inventario/smithShopUI.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area_body_entered(body):
	if body.name == "player":
		get_node("Camera").current=true
		var apriShop = shopUI.instance()
		body.UI.hide()
		body.lockMovement = true
		self.add_child(apriShop)
	pass # Replace with function body.


func _on_Area_body_exited(body):
	if body.name == "player":
		body.cam.current=true
	pass # Replace with function body.
