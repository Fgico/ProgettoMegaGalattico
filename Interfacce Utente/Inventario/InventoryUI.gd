extends Control

onready var weapons = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/Weapons")
onready var stats = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/ItemInspector/ItemInspector1/HBoxContainer/ScrollContainer/Stats")
onready var pStats = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/Tabs/playerStats")

var elem_curr = {
	 "tipo" : null,
	"id" : 0,
	"container" : null,
	"inventoryPos" : null
}


func _ready():
	pStats.updatePlayerStats()
	pass

func selezionaOggetto(container):
	if(elem_curr.container != null):
		elem_curr.container.backGround.texture = elem_curr.container.black
	elem_curr.tipo = container.itemKind
	elem_curr.id = container.itemId
	elem_curr.container = container
	elem_curr.inventoryPos = container.inventoryPos
	print(elem_curr)
	stats.updateValue(elem_curr.tipo, elem_curr.id)

func _on_Weapons_pressed():
	weapons.show()
	if(elem_curr.container != null):
		elem_curr.container.backGround.texture = elem_curr.container.black
		elem_curr = {
	 "tipo" : null,
	"id" : 0,
	"container" : null,
	"inventoryPos" : null
}

func _on_Equip_pressed():
	if elem_curr.tipo == 1:
		if(userData.equipped.curWeapon != 0):
			elem_curr.container.tipo = userData.equipped.curWeapon
		else:
			elem_curr.container.queue_free()
		sceneUtili.player.equipWeapon(elem_curr.id)
	if elem_curr.tipo == 2:
		var type = sceneUtili.player.equipArmor(elem_curr.id)
	pStats.updatePlayerStats()


func _on_TrashBin_pressed():
	pass # Replace with function body.


func _on_ExitButton_pressed():
	self.queue_free() 
	get_parent().UI.show()
	userData.saveToFile()
	sceneUtili.player.lockMovement = false
