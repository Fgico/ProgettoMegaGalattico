extends Node

var weapons = [
	null,
	{
		"name" : "sword",
		"mesh" : "res://Entita/Equipaggiabili/armi/Sword.tscn",
		"icon" : "res://Entita/Equipaggiabili/IconeUI",
		"dmg" : 1,
		"atkspd" : 1
	},
]

var armors = [
	null,
	{
		"name" : "sword",
		"mesh" : "res://Entita/Equipaggiabili/armi/Sword.tscn",
		"icon" : "res://Entita/Equipaggiabili/IconeUI",
		"def" : 1,
		"movspd" : 1
	},
]

var item_data

func _ready():
	var itemdata_file = File.new()
	itemdata_file.open("res://Singletons/ItemTable.json", File.READ)
	var itemdata_json = JSON.parse(itemdata_file.get_as_text())
	itemdata_file.close()
	item_data = itemdata_json.result
	print(item_data)
