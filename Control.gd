extends Control

var inventario = preload("res://Interfacce Utente/Inventario/InventoryUI.tscn")


func _on_TextureRect_pressed():
	var inventario_creato = inventario.instance()
	get_parent().add_child(inventario_creato)
	self.queue_free()
