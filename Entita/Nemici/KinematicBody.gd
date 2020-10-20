extends Combattente


onready var nav = get_parent().get_node("Navigation")
onready var player = get_parent().get_node("player")
var path = []
var direzione

func _ready():
	pass

func _process(delta):
	var arrivo = nav.get_closest_point(player.global_transform.origin)
	var partenza = nav.get_closest_point(self.global_transform.origin)
	path = nav.get_simple_path(partenza, arrivo)
	direzione = path[1] - path[0]
	direzione = direzione.normalized() * stats.spd * delta * 3
	move_and_slide(direzione)
	
	

