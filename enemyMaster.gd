extends Node


onready var player = get_parent().get_parent().get_node("player")
onready var nemico = get_node("Combattente")

var contaNemici = 0


func _ready():
	pass # Replace with function body.

