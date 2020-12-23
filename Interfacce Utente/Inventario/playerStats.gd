extends VBoxContainer

onready var atkval = get_node("Atk/StatsValue")
onready var defval = get_node("Def/StatsValue2")
onready var atkspdval = get_node("Atkspd/StatsValue3")

func updatePlayerStats():
	atkval.text = str(sceneUtili.player.stats.atk)
	defval.text = str(sceneUtili.player.stats.def)
	atkspdval.text = str(sceneUtili.player.atkSpd)
