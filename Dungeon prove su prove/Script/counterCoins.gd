extends Label

var coins = 0

func _ready():
	text = String(coins)
	print(text)

#incremento coins raccolti
func _on_coin_coinCollected():
	coins = coins + 1
	_ready()
