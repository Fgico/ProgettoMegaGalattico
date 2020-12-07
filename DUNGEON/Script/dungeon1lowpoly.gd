extends Spatial

onready var animazioni = get_node("AreaSbarre/AnimationPlayer")
onready var camera = get_node("AreaSbarre/CameraSbarre")


func _ready():
	animazioni.stop()
	pass # Replace with function body.




func _on_AreaSbarre_body_entered(body):
	if body.is_in_group("player"):
		animazioni.play("animazioneSbarre")
		camera.current = true
	pass # Replace with function body.
