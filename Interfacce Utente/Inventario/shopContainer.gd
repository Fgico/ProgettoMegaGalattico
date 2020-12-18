extends HBoxContainer

var itemKind = null
var itemPos = 0
var itemType = null
var costo = 0

onready var backGround = get_node("ItemBackground")

var white = preload("res://Interfacce Utente/Inventario/whiteTexture.tres")
var black = preload("res://Interfacce Utente/Inventario/blackTexture.tres")

func putItem(kind: int, id : int):
	#inizializzo objData con i dati dell'oggetto da inserire
	#se kind = 1 cerco fra le armi, se 2 fra le armature
	var objData
	if(kind == 1):
		objData = ItemDB.weapons[id]
	if(kind == 2):
		objData = ItemDB.armors[id]
	self.get_node("ItemName").text = objData.name + "   price: %d" % objData.costo
	self.get_node("ItemBackground/ItemButton").texture_normal = load(objData.icon)
	self.itemKind = kind
	self.itemPos = id
	self.costo = objData.costo

func _on_ItemContainer_gui_input(event):
	if(event is InputEventScreenTouch and event.is_pressed()):
		get_parent().selezionaOggetto(itemKind, itemPos, self)
		backGround.texture = white
