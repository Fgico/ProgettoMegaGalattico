extends VBoxContainer

var container = preload("res://Interfacce Utente/Inventario/ItemContainer.tscn")

func _ready():
	for item in userData.inventory.armors:
		var newCont = container.instance()
		self.add_child(newCont)
		newCont.get_node("ItemName").text = ItemDB.armors[item].name
		var texture = load(ItemDB.armors[item].icon)
		newCont.get_node("ItemBackground/ItemButton").texture_normal = texture
		newCont.item = 1
		newCont.itemPos = item

func selezionaOggetto(oggetto, posOggetto):
	var parent = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()
	parent.elem_curr.tipo = oggetto
	parent.elem_curr.posizione = posOggetto
