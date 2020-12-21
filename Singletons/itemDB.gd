extends Node

const ICON_PATH = "res://Entita/Equipaggiabili/IconeUI/"

var weapons = [
	null,
	{
		"name" : "Sword",
		"mesh" : "res://Entita/Equipaggiabili/armi/Sword.tscn",
		"icon" : ICON_PATH + "Sword.png",
		"atk" : 10,
		"atkspd" : 5,
		"costo" : 20
	},
	{
		"name" : "Iron Sword",
		"mesh" : "res://Entita/Equipaggiabili/armi/Sword.tscn",
		"icon" : ICON_PATH + "Iron Sword.png",
		"atk" : 15,
		"atkspd" : 7,
		"costo" : 40
	},
	{
		"name" : "Steel Sword",
		"mesh" : "res://Entita/Equipaggiabili/armi/Sword.tscn",
		"icon" : ICON_PATH + "Steel Sword.png",
		"atk" : 20,
		"atkspd" : 10,
		"costo" : 60
	}
]


var armors = [
	null,
	{
		"name" : "Cloth Cuirass",
		"mesh" : "res://Entita/Equipaggiabili/armi/Sword.tscn",
		"icon" : ICON_PATH + "Cloth Cuirass.png",
		"def" : 5,
		"slot" : 1,
		"costo" : 20
	},
	{
		"name" : "Iron Cuirass",
		"mesh" : "res://Entita/Equipaggiabili/armi/Sword.tscn",
		"icon" : ICON_PATH + "Iron Cuirass.png",
		"def" : 10,
		"slot" : 1,
		"costo" : 40
	},
	{
		"name" : "Steel Cuirass",
		"icon" : ICON_PATH + "Iron Cuirass.png",
		"def" : 15,
		"slot" : 1,
		"costo" : 60
	},
	{
		"name" : "Cloth Helmet",
		"icon" : ICON_PATH + "Cloth Helmet.png",
		"def" : 5,
		"slot" : 0,
		"costo" : 20
	},
	{
		"name" : "Iron Helmet",
		"icon" : ICON_PATH + "Iron Helmet.png",
		"def" : 10,
		"slot" : 0,
		"costo" : 40
	},
	{
		"name" : "Steel Helmet",
		"icon" : ICON_PATH + "Iron Helmet.png",
		"def" : 15,
		"slot" : 0,
		"costo" : 60
	},
	{
		"name" : "Cloth Bottom",
		"icon" : ICON_PATH + "Cloth Bottom.png",
		"def" : 5,
		"slot" : 2,
		"costo" : 20
	},
	{
		"name" : "Iron Bottom",
		"icon" : ICON_PATH + "Iron Bottom.png",
		"def" : 10,
		"slot" : 2,
		"costo" : 40
	},
	{
		"name" : "Steel Bottom",
		"icon" : ICON_PATH + "Iron Bottom.png",
		"def" : 15,
		"slot" : 2,
		"costo" : 60
	},
	{
		"name" : "Cloth Boots",
		"icon" : ICON_PATH + "Cloth Boots.png",
		"def" : 5,
		"slot" : 3,
		"costo" : 20
	},
	{
		"name" : "Iron Boots",
		"icon" : ICON_PATH + "Iron Boots.png",
		"def" : 10,
		"slot" : 3,
		"costo" : 40
	},
	{
		"name" : "Steel Boots",
		"icon" : ICON_PATH + "Iron Boots.png",
		"def" : 15,
		"slot" : 3,
		"costo" : 60
	}
]
