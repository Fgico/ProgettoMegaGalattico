extends Combattente

var attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
var target = "player"

onready var manager = get_parent()
onready var anim = get_node("rotable/Skeleton/AnimationPlayer")
var path = null

var morto = false

func _ready():
	self.iniziaStats(1.5,1,20,1,300)
	

func _physics_process(delta):
		stunned -= delta
		if(stunned < 1):
			anim.playback_speed = 1
		if(manager.player != null):
			setTargetDir(manager.player.global_transform.origin - self.global_transform.origin)
		.physics_process(delta)
		#print("manager.nav = ", manager.nav)
		#print("manager.player = ", manager.player)
		#print("path = ", path)
		if (stato == Moving ):
			anim.play("SkeletonArmature|Skeleton_Running")

func hit(danno,nelement):
	if(not morto):
		stunned = 2
		anim.playback_speed = 0
		.hit(danno,nelement)


func muori():
	morto = true
	stunned = 0
	stato = Dead
	anim.play("SkeletonArmature|Skeleton_Death")

func _on_Area_body_entered(body):
	if(not morto):
		if(body.is_in_group(target)):
			attacca(attacco,target)
			anim.play("SkeletonArmature|Skeleton_Attack")

