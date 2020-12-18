extends Area


func _ready():
	self.show()
	pass # Replace with function body.

func _physics_process(delta):
	$coin.rotate_y(deg2rad(4))



func _on_coinBoss_body_entered(body):
	if body.is_in_group("player"):
		body.collectCoinBoss()
		$Timer.start()
		$AudioStreamPlayer.play()
		self.hide()
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
