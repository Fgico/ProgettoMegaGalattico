extends Control

var settings = preload("res://Interfacce Utente/Impostazioni e salvataggi cloud/Settings.tscn")
var cloud = preload("res://Interfacce Utente/Impostazioni e salvataggi cloud/CloudSaveManager.tscn")

#func _ready():
#	for button in $Menu/CenterRow/Buttons.get_children():
#		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	

func _on_SettingsButton_pressed():
	var setting_scene = settings.instance()
	self.add_child(setting_scene)


func _on_ContinueButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()
	

func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://nodo_isola.tscn")
	

func _on_CloudButton_pressed():
	var cloud_scene = cloud.instance()
	self.add_child(cloud_scene)
