extends VBoxContainer

var container = preload("res://Interfacce Utente/Inventario/ItemContainer.tscn")

func _ready():
	fillWeapons()

func fillWeapons():
	var pos = 0
	for item in userData.inventory.weapons:
		var newCont = container.instance()
		self.add_child(newCont)
		newCont.putItem(1, item, pos)
		pos += 1

func selezionaOggetto(container):
	var parent = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().selezionaOggetto(container)

