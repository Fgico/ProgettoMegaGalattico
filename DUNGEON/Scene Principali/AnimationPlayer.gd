extends AnimationPlayer

onready var personaggio = get_node("player")

func _process(delta):
	if personaggio.stato == personaggio.Moving:
		personaggio.anim.play("sword and shield run-loop")
