extends Node

var savePath = "user://DangerousSkies.save"

func _ready():
	loadFromFile()
	AudioServer.set_bus_mute(1, settings.musicMuted)
	AudioServer.set_bus_mute(2, settings.sfxMuted)

var userInfo = {
	"name" : "gino",
	"password" : "banfi"
}

var equipped = {
	"curWeapon" : 1,
	"head" : 0,
	"chest" : 0,
	"pants" : 0,
	"shoes" : 0
}

var numCoin = 0
var numItem = 0

var cityStatus = {
	"smith" : 1,
	"wizard" : 1
}

var inventory = {
	"weapons" : [1],
	"armors" : []
}

var settings = {
	"musicMuted" : false,
	"sfxMuted" : false,
	"shadows" : true,
	"shadowQuality" : 2,
	"details" : true,
	"fxVolume" : 5,
	"musicVolume" : 5
}

func saveToFile():
	var saveFile = File.new()
	saveFile.open(savePath,File.WRITE)
	saveFile.store_line(to_json(userInfo))
	saveFile.store_line(to_json(equipped))
	saveFile.store_line(to_json(numCoin))
	saveFile.store_line(to_json(numItem))
	saveFile.store_line(to_json(cityStatus))
	saveFile.store_line(to_json(settings))
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
	equipped.head = data.head
	equipped.chest = data.chest
	equipped.pants = data.pants
	equipped.shoes = data.shoes
	data = parse_json(loadFile.get_line())
	numCoin = data
	data = parse_json(loadFile.get_line())
	numItem = data
	data = parse_json(loadFile.get_line())
	cityStatus = data
	data = parse_json(loadFile.get_line())
	settings = data
	data = parse_json(loadFile.get_line())
	if(data != null):
		inventory = data
	loadFile.close()
	return true
