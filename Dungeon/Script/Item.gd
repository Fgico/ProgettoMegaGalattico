extends Area

signal itemCollected

func _ready():
	pass


func _physics_process(delta):
	$wrenchMesh.rotate_y(deg2rad(4))

#il giocatore entra in collisione con gli item e li raccoglie
func _on_Item_body_entered(body):
	if body.name == "player":
		$AnimationItems.play("animazioneItems")
		$Timer.start()


func _on_Timer_timeout():
	emit_signal("itemCollected")
	queue_free()

