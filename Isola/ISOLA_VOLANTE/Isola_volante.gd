extends Spatial

onready var player = sceneUtili.player
onready var fade = get_node("Transition/ColorRect/AnimationFading")

# Called when the node enters the scene tree for the first time.
func _ready():
	fade.stop()
	pass # Replace with function body.


func _on_AreaEntrata_body_entered(body):
	if (body.is_in_group("player")):
		body.UI.hide()
		fade.play("fadetoblack")
	pass # Replace with function body.



func _on_AnimationFading_animation_finished(fadetoblack):
	get_tree().root.get_node("nodo_isola").cambioPiano("res://DUNGEON/Scene Principali/Dun1.tscn")
	pass # Replace with function body.
