extends Control

var inventoryScreen = preload("res://Interfacce Utente/Inventario/InventoryUI.tscn")
var menu_sett = preload("res://Interfacce Utente/Impostazioni e salvataggi cloud/Settings.tscn")

onready var player = get_parent().get_parent().get_parent().get_parent()
onready var pauseMenu = get_node("PauseMenu")
onready var pause = get_node("pause")

onready var spatk1 = get_node("gameButtons/special/spatk1")
onready var spatk2 = get_node("gameButtons/special/spatk2")
onready var spatk3 = get_node("gameButtons/special/spatk3")
onready var spatk4 = get_node("gameButtons/special/spatk4")

onready var save = preload("res://Interfacce Utente/Impostazioni e salvataggi cloud/CloudSaveManager.tscn")

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


var touchIdx = -1

func _on_special_gui_input(event):
	if(event is InputEventScreenDrag and spatkPos!= null):
		var drag =  spatkPos - event.position
		if(drag.length() / OS.get_screen_dpi() > 0.5):
			drag = drag.normalized()
			if(drag.x > -0.5 and (drag.y < 0.5  and drag.y >-0.5)):
				spawnaSpatk(0)
			if(drag.y > -0.5 and (drag.x < 0.5  and drag.x >-0.5)):
				spawnaSpatk(1)
			elif(drag.x < 0.5 and (drag.y < 0.5  and drag.y >-0.5)):
				spawnaSpatk(2)
			elif(drag.y < 0.5 and (drag.x < 0.5  and drag.x >-0.5)):
				spawnaSpatk(3)
	elif(event is InputEventScreenTouch and event.is_pressed() and spatkPos == null ):
		spatk1.show()
		spatk2.show()
		spatk3.show()
		spatk4.show()
		spatkPos = event.position
		touchIdx = event.index

				
func _input(event):
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
	if( i< player.knownSpecials.size()):
		player.attaccaChecked(player.knownSpecials[i],true)
	tastoSpecialLevatutto()


func _on_attacco_gui_input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		player.attaccaChecked(player.attaccoBase,false)



func _on_scatto_gui_input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		player.scatta()



func _on_ProgressBar_gui_input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		player.scatta()


func _on_bag_pressed():
	var inv = inventoryScreen.instance()
	player.add_child(inv)
	player.UI.hide()
	player.lockMovement = true


func _on_Settings_pressed():
	var settings = menu_sett.instance()
	self.add_child(settings)
	player.UI.show()
	pass # Replace with function body.



func _on_pause_pressed():
	pause.hide()
	pauseMenu.show()
	get_tree().paused = true
	pass # Replace with function body.
	


func _on_Save_gui_input(event):
	if event is InputEventScreenTouch:
		get_tree().paused = false
		get_tree().change_scene("res://Interfacce Utente/ScenaIniziale/TitleScreen.tscn")
	pass # Replace with function body.
