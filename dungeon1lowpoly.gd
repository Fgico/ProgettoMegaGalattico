extends Spatial

onready var animazioni = get_node("AreaSbarre/AnimationPlayer")
onready var camera = get_node("AreaSbarre/Camera")

# Called when the node enters the scene tree for the first time.
func _ready():
	animazioni.stop()
	pass # Replace with function body.




func _on_AreaSbarre_body_entered(body):
	if body.is_in_group():
		camera.current() == true
		animazioni.play("animazioneSbarre")
	pass # Replace with function body.
