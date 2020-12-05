extends Combattente

var attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
var target = "player"

onready var manager = get_parent()
onready var anim = get_node("rotable/Skeleton/AnimationPlayer")
var path 

var morto = false

func _ready():
	manager.figli.append(self)
	self.iniziaStats(1.5,1,20,1,300)
	
func _process(delta):
	stunned -= delta
	if(stunned < 1):
		anim.playback_speed = 1
	if(path != null and path.size()>1):
		if( (path[0] - self.global_transform.origin).length() < 1):
			path.remove(0)
		if(path.size()>1):
			setTargetDir( path[1] - self.global_transform.origin)
	else:
		setTargetDir(Vector3(0,0,0))
	
func _physics_process(delta):
		.physics_process(delta)
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

