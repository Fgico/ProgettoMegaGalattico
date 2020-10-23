extends Attacco


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	iniziaStats(40,1,30,1.6)
	get_node("RaggioFuoco").emitting = true

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	.hit(body)
	pass # Replace with function body.
