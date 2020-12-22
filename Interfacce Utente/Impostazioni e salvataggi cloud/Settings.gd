extends Control

onready var audioPanel = get_node("NinePatchRect/Audio")
onready var videoPanel = get_node("NinePatchRect/Video")

onready var musicCheck = get_node("NinePatchRect/Audio/musicMute")
onready var sfxCheck = get_node("NinePatchRect/Audio/sfxMute")

onready var fxSlider = get_node("NinePatchRect/Audio/HSlider2")
onready var musicSlider = get_node("NinePatchRect/Audio/HSlider")

onready var shadowCheck = get_node("NinePatchRect/Video/shadowCheck")
onready var detailCheck = get_node("NinePatchRect/Video/detailsCheck")

func _ready():
	musicCheck.pressed = userData.settings.musicMuted
	sfxCheck.pressed = userData.settings.sfxMuted
	shadowCheck.pressed = userData.settings.shadows
	detailCheck.pressed = userData.settings.details
	pass 



func _on_audio_pressed():
	audioPanel.show()
	videoPanel.hide()
	pass 


func _on_Video_pressed():
	videoPanel.show()
	audioPanel.hide()
	pass 


func _on_quit_pressed():
	userData.saveToFile()
	self.queue_free()


func _on_shadowCheck_toggled(button_pressed):
	userData.settings.shadows = button_pressed
	pass 


func _on_detailsCheck_toggled(button_pressed):
	userData.settings.details = button_pressed
	pass 


func _on_musicMute_toggled(button_pressed):
	userData.settings.musicMuted = button_pressed
	AudioServer.set_bus_mute(1, button_pressed)
	pass 


func _on_sfxMute_toggled(button_pressed):
	userData.settings.sfxMuted = button_pressed
	AudioServer.set_bus_mute(2, button_pressed)
	pass 


func _on_sfxSlider_value_changed(value):
	match value:
		1.0:
			AudioServer.set_bus_volume_db(2, -18)
		2.0:
			AudioServer.set_bus_volume_db(2, -15)
		3.0:
			AudioServer.set_bus_volume_db(2,-12)
		4.0:
			AudioServer.set_bus_volume_db(2,-9)
		5.0:
			AudioServer.set_bus_volume_db(2,0)
	userData.settings.sfxVolume = value

func _on_musicSlider_value_changed(value):
	match value:
		1.0:
			AudioServer.set_bus_volume_db(1, -18)
		2.0:
			AudioServer.set_bus_volume_db(1, -15)
		3.0:
			AudioServer.set_bus_volume_db(1,-12)
		4.0:
			AudioServer.set_bus_volume_db(1,-9)
		5.0:
			AudioServer.set_bus_volume_db(1, 0)
	userData.settings.musicVolume = value
