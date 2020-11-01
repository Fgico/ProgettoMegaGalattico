extends StaticBody

onready var animazioni = get_node("AnimationPlayer")


func _ready():
	animazioni.stop()
	
func _process(delta):
	animazioni.play("animazioneSbarre")
