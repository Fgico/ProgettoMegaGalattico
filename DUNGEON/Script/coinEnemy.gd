extends Area


func _ready():
	self.show()
	pass # Replace with function body.

func _physics_process(delta):
	$coin.rotate_y(deg2rad(4))


func _on_coinEnemy_body_entered(body):
	if body.is_in_group("player"):
		body.addCoins(3)
		$AudioStreamPlayer.play()
		self.hide()
		$Timer.start()
	pass # Replace with function body.



func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
