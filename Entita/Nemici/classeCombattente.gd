extends KinematicBody

class_name  Combattente

var hp = 100
var mp = 100

var atk = 1
var def = 1

var element
onready var spawnAtk = get_node("rotable/spawnAtk") 

func attacca(attacco):
	var attacked = attacco.instance()
	get_parent().add_child(attacked)
	attacked.global_transform.origin = spawnAtk.global_transform.origin
	mp -= attacked.mpCost
	attacked.danno *= atk

func hit(danno,element):
	hp -= danno - def
