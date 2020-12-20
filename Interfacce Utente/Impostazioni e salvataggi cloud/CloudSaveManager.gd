extends Control

onready var menu = get_node("TextureRect/Menu")
onready var login = get_node("TextureRect/login")
onready var register = get_node("TextureRect/register")

func _ready():
	pass 

func _on_load_pressed():
	login.show()
	login.saveOrLoad = 0
	menu.hide()
	pass 


func _on_save_pressed():
	login.show()
	login.saveOrLoad = 1
	menu.hide()
	pass 


func _on_register_pressed():
	register.show()
	menu.hide()
	pass 


func _on_quitButtonMenu_pressed():
	self.queue_free()
	pass 


func _on_quitButtonLogin_pressed():
	login.hide()
	login.res.text = ""
	menu.show()
	pass 


func _on_quitButtonRegister_pressed():
	register.hide()
	register.res.text = ""
	menu.show()
	pass 
