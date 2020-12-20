extends VBoxContainer

onready var atkval = get_node("Attack/StatsValue")
onready var defval = get_node("Defense/StatsValue")
onready var atkspdval = get_node("AtkSpeed/StatsValue")

func updatePlayerStats():
	atkval.text = str(sceneUtili.player.stats.atk)
	defval.text = str(sceneUtili.player.stats.def)
	atkspdval.text = str(sceneUtili.player.atkSpd)
