extends Attacco

func _ready():
	danno = 0
	mpCost = 0
	
	pass


func _on_attacco_body_entered(body):
	.hit(body)
	pass # Replace with function body.
