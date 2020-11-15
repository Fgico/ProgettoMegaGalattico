extends Area


func _ready():
	pass # Replace with function body.


func _on_SbarreDun_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("res://Scene Principali/Passaggio.tscn")

