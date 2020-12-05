extends Node

var savePath = "user://DangerousSkies.save"

#func _ready():
#	loadFromFile()

#struttura di appoggio inizializzata per memorizzare
#l'id dell'oggetto e il loro livello,inutile salvarla
var equipabble = {
	"id" : 0,
	"lvl" : 1,
}


var userInfo = {
	"name" : "gino",
	"password" : "banfi"
}

var equipped = {
	"curWeapon" : null,
	"curArmor" : null,
	"spAtk1" : null,
	"spAtk2" : null,
	"spAtk3" : null,
	"spAtk4" : null,
}

var numCoin = 0
var numItem = 0

var cityStatus = {
	"smith" : 1,
	"wizard" : 1
}

var inventory = {
	
	
}


func saveToFile():
	var saveFile = File.new()
	saveFile.open(savePath,File.WRITE)
	saveFile.store_line(to_json(userInfo))
	saveFile.store_line(to_json(equipped))
	saveFile.store_line(to_json(numCoin))
	saveFile.store_line(to_json(numItem))
	saveFile.store_line(to_json(cityStatus))
	saveFile.close()

func loadFromFile():
	var loadFile = File.new()
	if not loadFile.file_exists(savePath):
		return
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
	loadFile.close()
