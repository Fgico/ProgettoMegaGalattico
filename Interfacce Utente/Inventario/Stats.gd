extends VBoxContainer

onready var atk = get_node("Attack")
onready var atkval = get_node("Attack/StatsValue")

onready var atkspd = get_node("AtkSpeed")
onready var atkspdval = get_node("AtkSpeed/StatsValue")

onready var def = get_node("Defense")
onready var defval = get_node("Defense/StatsValue")

func updateValue(kind, id):
	if(kind == 1):
		def.hide()
		atk.show()
		atkspd.show()
		var item = ItemDB.weapons[id]
		atkval.text = str(item.atk)
		atkspdval.text = str(stepify(item.atkspd,0.01))
		
	if(kind == 2):
		def.show()
		atk.hide()
		atkspd.hide()
		var item = ItemDB.armors[id]
		defval.text = str(item.def)
