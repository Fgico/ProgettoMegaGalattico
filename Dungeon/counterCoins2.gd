extends Label

var coins = 0

func _ready():
	 text = String(coins)

#incremento monete raccolte
func _on_coin_coinCollected():
	coins = coins + 1
	_ready()

