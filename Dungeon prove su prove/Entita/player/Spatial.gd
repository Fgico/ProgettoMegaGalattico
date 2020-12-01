extends Spatial

var score = 0 setget set_score

func set_score (value):
	score = value
	get_node("/root/UIcoins_item/counterCoins").set_text(score)
