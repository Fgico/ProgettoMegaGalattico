extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if body.name == "player":
		get_node("Camera").current=true
	pass # Replace with function body.


func _on_Area_body_exited(body):
	if body.name == "player":
		body.cam.current=true
	pass # Replace with function body.
