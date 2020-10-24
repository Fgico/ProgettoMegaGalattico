extends Attacco

func _ready():
	iniziaStats(16,0,0,0.8)
	get_node("swordSlash").emitting = true

func _on_Area_body_entered(body):
	.hit(body)
	pass
