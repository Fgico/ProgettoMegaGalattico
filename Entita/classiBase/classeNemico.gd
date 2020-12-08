extends Combattente
class_name  Nemico

var attacco
var anim

var target = "player"

var path = null

var morto = false

onready var manager = get_parent()

func _physics_process(delta):
		stunned -= delta
		if(stunned < 1):
			anim.playback_speed = 1
		if(manager.player != null):
			setTargetDir(manager.player.global_transform.origin - self.global_transform.origin)

func hit(danno,nelement):
	if(not morto):
		stunned = 2
		anim.playback_speed = 0
		.hit(danno,nelement)

func muori():
	get_node("CollisionShape").disabled = true
	self.gravity = Vector3.UP * 0
	morto = true
	stunned = 0
	stato = Dead
