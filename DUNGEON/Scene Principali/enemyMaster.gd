extends Node

onready var player = get_parent().get_parent().get_node("player")
onready var nav = get_node("Navigation")
var contaNemici = 0

func _ready():
	player = null
	pass # Replace with function body.



func _on_AreaNemico_body_entered(body):
	if body.is_in_group("player"):
		player = body
		

