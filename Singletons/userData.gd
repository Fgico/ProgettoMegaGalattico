extends Node

var savePath = "user://DangerousSkies.save"

#func _ready():
#	loadFromFile()

var userInfo = {
	"name" : "gino",
	"password" : "banfi"
}

var equipped = {
	"curWeapon" : 0,
	"curArmor" : 0,
	"spAtk1" : 0,
	"spAtk2" : 0,
	"spAtk3" : 0,
	"spAtk4" : 0,
}

var numCoin = 100
var numItem = 100

var cityStatus = {
	"smith" : 1,
	"wizard" : 1
}

var inventory = {
	"weapons" : [1],
	"armors" : [1],
	"consumable" : []
}

var settings = {
	"musicMuted" : false,
	"sfxMuted" : false,
	"shadows" : true,
	"shadowQuality" : 2,
	"details" : true
}

func saveToFile():
	var saveFile = File.new()
	saveFile.open(savePath,File.WRITE)
	saveFile.store_line(to_json(userInfo))
	saveFile.store_line(to_json(equipped))
	saveFile.store_line(to_json(numCoin))
	saveFile.store_line(to_json(numItem))
	saveFile.store_line(to_json(cityStatus))
	saveFile.store_line(to_json(inventory))
	saveFile.close()

func loadFromFile():
	var loadFile = File.new()
	if not loadFile.file_exists(savePath):
		return false
	loadFile.open(savePath, File.READ)
	var data = parse_json(loadFile.get_line())
	userInfo.name = data.name
	userInfo.password = data.password
	data = parse_json(loadFile.get_line())
	equipped.curWeapon = data.curWeapon
	equipped.curArmor = data.curArmor
	equipped.spAtk1 = data.spAtk1
	equipped.spAtk2 = data.spAtk2
	equipped.spAtk3 = data.spAtk3
	equipped.spAtk4 = data.spAtk4
	data = parse_json(loadFile.get_line())
	numCoin = data
	data = parse_json(loadFile.get_line())
	numItem = data
	data = parse_json(loadFile.get_line())
	cityStatus = data
	data = parse_json(loadFile.get_line())
	if(data != null):
		inventory = data
	loadFile.close()
	return true
