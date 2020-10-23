extends Control

onready var player = get_parent().get_parent().get_parent().get_parent()

func _on_Resume_pressed():
	get_tree().paused = false
	get_node("PauseMenu").hide()
	get_node("pause").show()
	pass # Replace with function body.

func _on_pause_button_down():
	get_node("pause").hide()
	get_node("PauseMenu").show()
	get_tree().paused = true
	pass # Replace with function body.

func _on_attacco_button_down():
	player.attaccaChecked(player.attacco,true)
	pass # Replace with function body.

func _on_scatto_button_down():
	player.scatta()
	pass # Replace with function body.

func _on_special_button_down():
	
	pass # Replace with function body.
