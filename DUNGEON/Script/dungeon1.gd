extends Spatial

onready var animazioni = get_node("AreaSbarre/AnimationPlayer")
onready var camera = get_node("AreaSbarre/Camera")
onready var fade = get_node("TransitionD1/ColorRect/AnimationFading1")

func _ready():
	animazioni.stop()
	fade.stop()
	pass


func _on_AreaSbarre_body_entered(body):
	if body.is_in_group("player"):
		body.UI.hide()
		camera.current = true
		animazioni.play("animazioneSbarre")
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(animazioneSbarre):
	fade.play("fadetoblack1")
	pass # Replace with function body.


func _on_AnimationFading1_animation_finished(fadetoblack1):
	get_tree().root.get_node("nodo_isola").cambioPiano("res://DUNGEON/Scene Principali/Dun2.tscn")
	pass # Replace with function body.
