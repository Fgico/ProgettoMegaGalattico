extends Control

onready var atkval = get_node("StatsValue")
onready var defval = get_node("StatsValue2")
onready var atkspdval = get_node("StatsValue3")

func updatePlayerStats():
	atkval.text = str(sceneUtili.player.stats.atk)
	defval.text = str(sceneUtili.player.stats.def)
	atkspdval.text = str(sceneUtili.player.atkSpd)
