extends Area


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$cristalloMesh.rotate_y(deg2rad(4))

func _on_Cristallo_body_entered(body):
	if body.name == "player":
		body.collectItem()
		$AnimationItems.play("animationItems")
		$AudioStreamPlayer.play()
		$Timer.start()
	pass # Replace with function body.

func _on_Timer_timeout():
	queue_free()
