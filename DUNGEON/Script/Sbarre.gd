extends StaticBody

var ponte

onready var animazioni = get_node("AnimationPlayer")


func _ready():
	animazioni.stop()
	
func _process(delta):
	animazioni.play("animazioneSbarre")


func _on_AnimationPlayer_animation_finished(animazioneSbarre):
	#accedo al primo nodo della scena
	get_tree().root.get_node("nodo_dungeon").cambioPiano("res://DUNGEON/Scene Principali/Dun2_player.tscn")
