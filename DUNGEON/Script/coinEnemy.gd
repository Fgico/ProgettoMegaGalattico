extends Area


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$coin.rotate_y(deg2rad(4))


func _on_coinEnemy_body_entered(body):
	if body.is_in_group("player"):
		body.collectCoinEnemy()
		$AudioStreamPlayer.play()
	pass # Replace with function body.
