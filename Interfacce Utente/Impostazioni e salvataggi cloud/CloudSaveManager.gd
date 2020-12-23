extends Control

onready var menu = get_node("TextureRect/Menu")
onready var login = get_node("TextureRect/login")
onready var register = get_node("TextureRect/register")

func _ready():
	pass 

func _on_save_pressed():
	login.show()
	login.saveOrLoad = 0
	menu.hide()
	pass 


func _on_load_pressed():
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
	userData.saveToFile()
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


func _on_resetButton_pressed():
	userData.equipped = {
	"curWeapon" : 1,
	"head" : 0,
	"chest" : 0,
	"pants" : 0,
	"shoes" : 0
	}
	
	userData.numCoin = 0
	userData.numItem = 0
	
	userData.cityStatus = {
	"smith" : 1,
	"wizard" : 1
}
	
	userData.inventory = {
	"weapons" : [],
	"armors" : []
}
	userData.saveToFile()
	pass # Replace with function body.
