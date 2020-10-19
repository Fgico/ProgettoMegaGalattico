extends KinematicBody

class_name  Combattente

var stats = {
	"hpmax" : 100,
	"mpmax" : 100,
	"atk" : 1,
	"def" : 1,
	"spd" : 200
}

var hp = 100
var mp = 100

var element
onready var spawnAtk = get_node("rotable/spawnAtk") 

func _init(natk=1,ndef=1, nhp = 100, nmp = 100, nspd = 200):
	stats.atk = natk
	stats.def = ndef
	stats.hp = nhp
	stats.mp = nmp
	stats.spd = nspd

func attacca(attacco):
	var attacked = attacco.instance()
	get_parent().add_child(attacked)
	attacked.global_transform.origin = spawnAtk.global_transform.origin
	mp -= attacked.mpCost
	attacked.danno *= stats.atk

func hit(danno,element):
	hp -= (danno + stats.def)
