extends Control

onready var player = get_parent().get_parent().get_parent().get_parent()
onready var pauseMenu = get_node("PauseMenu")
onready var pause = get_node("pause")

onready var spatk1 = get_node("gameButtons/special/spatk1")
onready var spatk2 = get_node("gameButtons/special/spatk2")
onready var spatk3 = get_node("gameButtons/special/spatk3")
onready var spatk4 = get_node("gameButtons/special/spatk4")

var spatkPos = null

func _on_Resume_pressed():
	get_tree().paused = false
	pauseMenu.hide()
	pause.show()
	pass # Replace with function body.

func _on_pause_button_down():
	pause.hide()
	pauseMenu.show()
	get_tree().paused = true
	pass # Replace with function body.

var touchIdx = -1

func _on_special_gui_input(event):
	if(event is InputEventScreenTouch and event.is_pressed() ):
		spatk1.show()
		spatk2.show()
		spatk3.show()
		spatk4.show()
		spatkPos = event.position
		touchIdx = event.index
	if(event is InputEventScreenDrag and spatkPos!= null):
		var drag =  spatkPos - event.position
		if(drag.length() / OS.get_screen_dpi() > 1):
			drag = drag.normalized()
			if(drag.x > -0.5 and (drag.y < 0.5  and drag.y >-0.5)):
				spawnaSpatk(0)
			if(drag.y > -0.5 and (drag.x < 0.5  and drag.x >-0.5)):
				spawnaSpatk(1)
			elif(drag.x < 0.5 and (drag.y < 0.5  and drag.y >-0.5)):
				spawnaSpatk(2)
			elif(drag.y < 0.5 and (drag.x < 0.5  and drag.x >-0.5)):
				spawnaSpatk(3)
	if(event is InputEventScreenTouch and not event.is_pressed() and event.index == touchIdx ):
		tastoSpecialLevatutto()
		touchIdx = -1
	

func tastoSpecialLevatutto():
	spatk1.hide()
	spatk2.hide()
	spatk3.hide()
	spatk4.hide()
	spatkPos = null

func spawnaSpatk(i):
	if(i< player.knownSpecials.size()):
		player.attaccaChecked(player.knownSpecials[i],true)
	tastoSpecialLevatutto()


func _on_attacco_gui_input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		player.attaccaChecked(player.attaccoBase,false)



func _on_scatto_gui_input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		player.scatta()

