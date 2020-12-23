extends Path


onready var follow = get_node("PathFollow")


func _ready():
	set_process(true)
	
func _process(delta):
	follow.set_offset(follow.get_offset() + 3 * delta)
