extends Control

var shopLevel = 1
var levelCosts = [25,50]
var upgradeCost = 0

var elem_curr = {
	 "tipo" : null,
	"posizione" : 0,
	"container" : null,
	"costo" : 0
}

# l'array esterno contiene quali elementi far apparire nello shop per livello
var shopItemsbyLevel = [
	 [1,4,7,10],
	[2,5,8,11],
	[3,6,9,12]
	]

onready var itemList = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/itemScroll/VBoxContainer")
onready var upgradeButton = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/ItemInspector/Upgrade Store")
onready var stats = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/ItemInspector/ItemInspector1/HBoxContainer/ScrollContainer/Stats")
onready var upCostLabel = get_node("DoubleEdgesBackground/PaperBackground/VBoxContainer/MainElements/ItemInspector/UpgradeLabel")

onready var coinCounter = get_node("DoubleEdgesBackground/PaperBackground/Control/coins/Label")
onready var itemCounter = get_node("DoubleEdgesBackground/PaperBackground/Control/chiavi/Label")

var emptyContainer = preload("res://Interfacce Utente/Inventario/shopContainer.tscn")

func selezionaOggetto(oggetto, posOggetto, container):
	if(elem_curr.container != null):
		elem_curr.container.backGround.texture = elem_curr.container.black
	elem_curr.tipo = oggetto
	elem_curr.posizione = posOggetto
	elem_curr.container = container
	elem_curr.costo = container.costo
	stats.updateValue(elem_curr.tipo, elem_curr.posizione)

func _ready():
	shopLevel = userData.cityStatus.smith
	checkStoreUpgrades()
	fillShop()
	updateCounters()

func checkStoreUpgrades():
	if(shopLevel< 3):
		upgradeCost = levelCosts[shopLevel-1]
		upCostLabel.text = "Upgrade price: %d" %upgradeCost
	else:
		upgradeButton.hide()
		upCostLabel.hide()

func updateCounters():
	coinCounter.text = str(sceneUtili.player.coins)
	itemCounter.text = str(sceneUtili.player.items)

func fillShop():
	#levo eventuale roba vecchia
	for container in itemList.get_children():
		container.queue_free()
	#metto arma nuova
	var wpnCont = emptyContainer.instance()
	itemList.add_child(wpnCont)
	wpnCont.putItem(1, shopLevel)
	#metto set armature nuove
	for item in shopItemsbyLevel[shopLevel-1]:
		var newCont = emptyContainer.instance()
		itemList.add_child(newCont)
		newCont.putItem(2, item)

func _on_buy_pressed():
	if( elem_curr.tipo != null and elem_curr.costo <= userData.numCoin):
		if(elem_curr.tipo == 1):
			userData.inventory.weapons.append(elem_curr.posizione)
		if(elem_curr.tipo == 2):
			userData.inventory.armors.append(elem_curr.posizione)
		sceneUtili.player.addCoins( -elem_curr.costo )
		updateCounters()


func _on_ExitButton_pressed():
	self.queue_free()
	sceneUtili.player.lockMovement = false
	pass


func _on_upgrade_pressed():
	if(shopLevel< 3 and userData.numItem >= upgradeCost):
		shopLevel += 1
		sceneUtili.player.changeNumItem(userData.numItem - upgradeCost)
		checkStoreUpgrades()
		fillShop()
		updateCounters()
		pass
