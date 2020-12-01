extends Attacco

func _ready():
	iniziaStats(40,1,30,1.2)
	get_node("RaggioFuoco").emitting = true

func _on_Area_body_entered(body):
	.hit(body)
	pass
