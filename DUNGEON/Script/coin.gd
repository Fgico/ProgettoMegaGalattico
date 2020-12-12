extends Area

func _ready():
	pass


func _physics_process(delta):
	$coinMesh.rotate_y(deg2rad(4))

#il giocatore entra in collisione con le monete e le raccoglie
func _on_coin_body_entered(body):
	if body.is_in_group("player"):
		body.collectCoin()
		$AudioStreamPlayer.play()
		$AnimationCoins.play("animazioneCoins")
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
