extends Attacco

func _ready():
	iniziaStats(1,1,30,1.2)
	self.malusRate = 0.4
	get_node("RaggioFuoco").emitting = true

func _on_Area_body_entered(body):
	.hit(body)
	pass
