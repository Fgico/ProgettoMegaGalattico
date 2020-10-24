extends Attacco

func _ready():
	iniziaStats(20,Ghiaccio,25,1.5)
	get_node("folataghiacciata").emitting = true

func _on_Area_body_entered(body):
	.hit(body)
	pass # Replace with function body.
