extends Control

onready var audioPanel = get_node("NinePatchRect/Audio")
onready var videoPanel = get_node("NinePatchRect/Video")

func _ready():
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
	self.queue_free()


func _on_shadowSlider_value_changed(value):
	print(value)
	match value:
		1.0:
			print(ProjectSettings.set_setting("rendering/quality/directional_shadow/size.mobile", 1024))
			ProjectSettings.set_setting("rendering/quality/directional_shadow/size", 1024)
		2.0:
			ProjectSettings.set_setting("rendering/quality/directional_shadow/size.mobile", 2048)
			ProjectSettings.set_setting("rendering/quality/directional_shadow/size", 2048)
		3.0:
			ProjectSettings.set_setting("rendering/quality/directional_shadow/size.mobile", 4096)
			ProjectSettings.set_setting("rendering/quality/directional_shadow/size", 4096)
	ProjectSettings.save()


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
