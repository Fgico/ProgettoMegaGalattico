extends Spatial

onready var animazione = get_node("AreaSbarre2/AnimationPlayer")
onready var camera2 = get_node("AreaSbarre2/Camera")

func _ready():
	animazione.stop()
	pass # Replace with functsion body.



func _on_AreaSbarre2_body_entered(body):
	if body.is_in_group("player"):
		body.UI.hide()
		camera2.current = true
		animazione.play("animazioneSbarre2")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(animazioneSbarre2):
	get_tree().change_scene("res://Isola/ISOLA_VOLANTE/Isola_volante.tscn")
	pass # Replace with function body.
