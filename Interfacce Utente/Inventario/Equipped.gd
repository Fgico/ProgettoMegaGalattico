extends Control

var head = 0
var chest = 0
var pants = 0
var shoes = 0
var weapon = 0

onready var blackbg = load("res://Interfacce Utente/Inventario/blackTexture.tres")

onready var headIcon = get_node("headbg/headico")
onready var chestIcon = get_node("chestbg/chestico")
onready var pantsIcon = get_node("pantsbg/pantsico")
onready var shoesIcon = get_node("shoesbg/shoesico")
onready var swordIcon = get_node("armaBackground/armaIcon")

onready var headbg = get_node("headbg")
onready var chestbg = get_node("chestbg")
onready var pantsbg = get_node("pantsbg")
onready var shoesbg = get_node("shoesbg")
onready var weaponbg = get_node("armaBackground")


func _ready():
	updateScreen()

func updateScreen():
	head = userData.equipped.head
	pants = userData.equipped.pants
	chest = userData.equipped.chest
	shoes = userData.equipped.shoes
	weapon = userData.equipped.curWeapon
	if(head != 0):
		headIcon.texture = load(ItemDB.armors[head].icon)
		headbg.texture = blackbg
	if(pants != 0):
		pantsIcon.texture = load(ItemDB.armors[pants].icon)
		pantsbg.texture = blackbg
	if(chest != 0):
		chestIcon.texture = load(ItemDB.armors[chest].icon)
		chestbg.texture = blackbg
	if(shoes != 0):
		shoesIcon.texture = load(ItemDB.armors[shoes].icon)
		shoesbg.texture = blackbg
	if(weapon != 0):
		swordIcon.texture = load(ItemDB.weapons[weapon].icon)
		weaponbg.texture = blackbg
	pass
