extends Spatial

onready var animazioni = get_node("AreaSbarre/AnimationPlayer")
onready var camera = get_node("AreaSbarre/Camera")

func _ready():
	animazioni.stop()
	pass # Replace with function body.


func _on_AreaSbarre_body_entered(body):
	if body.is_in_group("player"):
		camera.current = true
		animazioni.play("animazioneSbarre")
	pass # Replace with function body.




func _on_AnimationPlayer_animation_finished(animazioneSbarre):
	get_tree().root.get_node("nodo_dungeon").cambioPiano("res://DUNGEON/Scene Principali/Dun2.tscn")
	pass # Replace with function body.
