extends HBoxContainer

var item = null
var itemPos = 0
var itemType = null

onready var backGround = get_node("ItemBackground")

var white = preload("res://Interfacce Utente/Inventario/whiteTexture.tres")
var black = preload("res://Interfacce Utente/Inventario/blackTexture.tres")

func _on_ItemContainer_gui_input(event):
	get_parent().selezionaOggetto(item, itemPos, self, itemType)
	backGround.texture = white
