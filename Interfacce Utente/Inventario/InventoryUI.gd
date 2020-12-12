extends Control

onready var weapons = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/Weapons")
onready var armor = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/Armor")
onready var consum = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/Consumable")
onready var other = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/Other")

var elem_curr = {
	 "tipo" : null,
	"posizione" : 0
}


func _ready():
	pass


func _on_Weapons_pressed():
	weapons.show()
	armor.hide()
	consum.hide()
	other.hide()


func _on_Armor_pressed():
	weapons.hide()
	armor.show()
	consum.hide()
	other.hide()


func _on_Consumable_pressed():
	weapons.hide()
	armor.hide()
	consum.show()
	other.hide()

func _on_Other_pressed():
	weapons.hide()
	armor.hide()
	consum.hide()
	other.show()


func _on_Equip_pressed():
	if elem_curr.tipo != null:
		if elem_curr.tipo == 0:
			userData.equipped.curWeapon = elem_curr.posizione
			sceneUtili.player.stats.atk = ItemDB.weapons[elem_curr.posizione].dmg / 10
		if elem_curr.tipo == 1:
			userData.equipped.curArmor = elem_curr.posizione
			sceneUtili.player.stats.def = ItemDB.armors[elem_curr.posizione].def


func _on_TrashBin_pressed():
	pass # Replace with function body.


func _on_Compare_pressed():
	pass # Replace with function body.


func _on_ExitButton_pressed():
	self.queue_free() 
