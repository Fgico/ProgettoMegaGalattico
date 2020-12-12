extends Nemico

var fuoco = load("res://Entita/Attacchi/Speciali/fuoco/lanciafiamme.tscn")


func _ready():
	self.iniziaStats(1.5,100,20,100,350)
	attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
	anim = get_node("rotable/mesh/AnimationPlayer")
	get_parent().contaNemici += 1
	print("nasce drago: ", get_parent().contaNemici)

func _physics_process(delta):
	.physics_process(delta)
	if stato == Moving:
		anim.play("DragonArmature|Dragon_Flying")

func muori():
	.muori()
	get_parent().contaNemici -= 1
	print("muore drago: ", get_parent().contaNemici)
	anim.play("DragonArmature|Dragon_Death")
	var coins_scene = preload("res://DUNGEON/Scene Principali/coinBoss.tscn")
	var coin = coins_scene.instance()
	get_parent().add_child(coin)
	coin.global_transform.origin = spawnAtk.global_transform.origin
	coins_scene = coin
	var anim = coins_scene.get_node("AnimationCascata2")
	anim.play("animazioneCascata2")
	$Flash.play("deathFlash")
	$Timer.start()


func _on_Area_body_entered(body):
	if(not morto and stunned <=1):
		if(body.is_in_group(target)):
			if(mp > 30):
				attacca(fuoco,target)
			else:
				attacca(attacco,target)
			anim.play("DragonArmature|Dragon_Attack2")


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
