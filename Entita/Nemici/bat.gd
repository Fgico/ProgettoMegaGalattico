extends Nemico

func _ready():
	self.iniziaStats(1.5,60,20,1,350)
	attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
	anim = get_node("rotable/mesh/AnimationPlayer")

func _physics_process(delta):
	.physics_process(delta)
	if stato == Moving:
		anim.play("BatArmature|Bat_Flying")

func muori():
	.muori()
	anim.play("BatArmature|Bat_Death")

func _on_Area_body_entered(body):
	print("ciao")
	if(not morto):
		if(body.is_in_group(target)):
			attacca(attacco,target)
			anim.play("BatArmature|Bat_Attack2")
