extends VBoxContainer

var container = preload("res://Interfacce Utente/Inventario/ItemContainer.tscn")

func _ready():
	for item in userData.inventory.weapons:
		var newCont = container.instance()
		self.add_child(newCont)
		newCont.get_node("ItemName").text = ItemDB.weapons[item].name
		var texture = load(ItemDB.weapons[item].icon)
		newCont.get_node("ItemBackground/ItemButton").texture_normal = texture
		
