extends StaticBody

onready var animazioni = get_node("AnimationPlayer")


func _ready():
	animazioni.stop()
	
func _process(delta):
	animazioni.play("animazioneSbarre")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Dun2_player.tscn")
