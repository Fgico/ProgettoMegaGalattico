extends Node


onready var player = get_parent().get_parent().get_node("player")
onready var nav = get_node("Navigation")
onready var nemico = get_node("Combattente")

var contaNemici = 0


func _ready():
	pass # Replace with function body.

