extends Control

var inventario = preload("res://Interfacce Utente/Inventario/InventoryUI.tscn")

func _ready():
	pass


func _on_TextureRect_pressed():
	var inventario_creato = inventario.instance()
	add_child(inventario_creato)
