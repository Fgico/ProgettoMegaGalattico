extends VBoxContainer

onready var atkval = get_node("HBoxContainer/StatsValue")
onready var defval = get_node("HBoxContainer2/StatsValue2")
onready var atkspdval = get_node("HBoxContainer3/StatsValue3")

func updatePlayerStats():
	atkval.text = str(sceneUtili.player.stats.atk)
	defval.text = str(sceneUtili.player.stats.def)
	atkspdval.text = str(sceneUtili.player.atkSpd)
