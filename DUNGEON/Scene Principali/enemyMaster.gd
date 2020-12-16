extends Node

onready var player = null
onready var nav = get_node("Navigation")
var contaNemici = 0

func _ready():
	pass # Replace with function body.


func _on_AreaNemico_body_entered(body):
	if(body.is_in_group("player")):
		player = body
	pass # Replace with function body.
