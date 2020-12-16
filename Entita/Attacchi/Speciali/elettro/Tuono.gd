extends Attacco 

func _ready():
	iniziaStats(40,Elettro,60,1)
	malusRate = 0.4

func _on_Area_body_entered(body):
	.hit(body)
	pass # Replace with function body.

