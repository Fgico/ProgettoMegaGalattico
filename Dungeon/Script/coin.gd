extends Area

signal coinCollected

func _ready():
	pass


func _physics_process(delta):
	$coinMesh.rotate_y(deg2rad(4))

#il giocatore entra in collisione con le monete e le raccoglie
func _on_coin_body_entered(body):
	if body.name == "player":
		$AudioStreamPlayer.play()
		$AnimationCoins.play("animazioneCoins")
		$Timer.start()


func _on_Timer_timeout():
	emit_signal("coinCollected")
	queue_free()
