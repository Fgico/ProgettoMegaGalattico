extends Area


func _ready():
	$cristalloMesh.rotate_y(deg2rad(4))
	pass # Replace with function body.


func _on_Cristallo_body_entered(body):
	if body.name == "player":
		body.collectItem()
		$AudioStreamPlayer.play()
		$Timer.start()
	pass # Replace with function body.

func _on_Timer_timeout():
	queue_free()
