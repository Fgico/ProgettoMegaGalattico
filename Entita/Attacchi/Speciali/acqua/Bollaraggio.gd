extends Attacco

func _ready():
	iniziaStats(15,Acqua,15,1)

func _on_Area_body_entered(body):
	.hit(body)
	pass # Replace with function body.

