extends Spatial

onready var player = get_node("player")
onready var fade = get_node("Transition/ColorRect/AnimationFading")

# Called when the node enters the scene tree for the first time.
func _ready():
	fade.stop()
	pass # Replace with function body.


func _on_AreaEntrata_body_entered(body):
	if body.is_in_group("player"):
		fade.play("fadetoblack")
	pass # Replace with function body.


func _on_AnimationFading_animation_finished(fadetoblack):
	get_tree().change_scene("res://DUNGEON/Scene Principali/nodo_dungeon.tscn")
	pass # Replace with function body.
