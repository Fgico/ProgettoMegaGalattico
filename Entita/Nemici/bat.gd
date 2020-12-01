extends Combattente

var attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
var target = "player"

onready var manager = get_parent()
onready var anim = get_node("rotable/Bat2/AnimationPlayer")

var path = null

var morto = false

func _ready():
	self.iniziaStats(1.5,60,20,1,350)

func _physics_process(delta):
	stunned -= delta
	if(stunned < 1):
		anim.playback_speed = 1
	if(manager.player != null):
		var from = manager.nav.get_closest_point(self.global_transform.origin)
		var to = manager.nav.get_closest_point(manager.player.global_transform.origin)
		path = manager.nav.get_simple_path(from,to)
	if(path != null):
		setTargetDir(path[1]-path[0])
	.physics_process(delta)
	if stato == Moving:
		anim.play("BatArmature|Bat_Flying")

func hit(danno,nelement):
	if(not morto):
		stunned = 2
		anim.playback_speed = 0
		.hit(danno,nelement)


func muori():
	morto = true
	stunned = 0
	stato = Dead
	anim.play("BatArmature|Bat_Death")

func _on_Area_body_entered(body):
	if(not morto):
		if(body.is_in_group(target)):
			print("ao")
			attacca(attacco,target)
			print("ai")
			anim.play("BatArmature|Bat_Attack2")
