extends Combattente

var attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")

var state = 0

onready var manager = get_parent()
onready var anim = get_node("rotable/Skeleton/AnimationPlayer")
var path = null

func _ready():
	self.iniziaStats(1.5,1,20,1,300)
	

func _physics_process(delta):
	stunned -= delta
	if(manager.player != null):
		var from = manager.nav.get_closest_point(self.global_transform.origin)
		var to = manager.nav.get_closest_point(manager.player.global_transform.origin)
		path = manager.nav.get_simple_path(from,to)
	if(path != null):
		setTargetDir(path[1]-path[0])
	.physics_process(delta)

func hit(danno,nelement):
	stunned = 2
	.hit(danno,nelement)
	print(stunned)

func muori():
	self.queue_free()

func _on_Area_body_entered(body):
	if(body.is_in_group("player")):
		attacca(attacco)
		anim.play("SkeletonArmature|Skeleton_Attack")

