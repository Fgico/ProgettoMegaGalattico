extends Spatial


func _ready():
	pass


func _process(delta):
	$Trappola/AnimationTrappola.play("animazioneTrappola")

#DANNO TRAPPOLA
func _on_Trappola_body_entered(body):
	if body.name == 'player':
		body.hit(10, 0)
	
