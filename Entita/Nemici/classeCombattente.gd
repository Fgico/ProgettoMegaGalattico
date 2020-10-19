extends KinematicBody

class_name  Combattente

var stats = {
	"hp" : 100,
	"mp" : 100,
	"atk" : 1,
	"def" : 1,
	"spd" : 1
}

var element
onready var spawnAtk = get_node("rotable/spawnAtk") 

func _init(natk=1,ndef=1, nhp = 100, nmp = 100, nspd = 1):
	stats.atk = natk
	stats.def = ndef
	stats.hp = nhp
	stats.mp = nmp
	stats.spd = nspd

func attacca(attacco):
	var attacked = attacco.instance()
	get_parent().add_child(attacked)
	attacked.global_transform.origin = spawnAtk.global_transform.origin
	stats.mp -= attacked.mpCost
	attacked.danno *= stats.atk

func hit(danno,element):
	stats.hp -= danno - stats.def
