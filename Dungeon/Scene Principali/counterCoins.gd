extends Label

var coins

func _ready():
 text = String(coins)

#incremento monete raccolte
func _on_coin_coinCollected(counterCoins):
	coins = coins + 1
	_ready()
