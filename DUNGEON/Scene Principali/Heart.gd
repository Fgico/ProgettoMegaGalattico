extends Area



func _ready():
	self.show()
	pass # Replace with function body.

func _physics_process(delta):
	$Heart2.rotate_y(deg2rad(4))


func _on_Heart_body_entered(body):
	if body.is_in_group("player"):
		if (body.healthBar.value < body.stats.maxhp): #se ha subito danni, raccogli. Altrimenti no.
			body.healthBar.value += 40
			body.hp = body.healthBar.value #aggiorno la status bar col valore attuale
			$AudioStreamPlayer.play()
			self.hide()
			$Timer.start()
			pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


