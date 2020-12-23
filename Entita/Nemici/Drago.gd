extends Nemico

var fuoco = load("res://Entita/Attacchi/Speciali/fuoco/lanciafiamme.tscn")


func _ready():
	self.iniziaStats(1.5,100,20,100,350)
	attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
	anim = get_node("rotable/mesh/AnimationPlayer")

func _physics_process(delta):
	.physics_process(delta)
	if stato == Moving:
		anim.play("DragonArmature|Dragon_Flying")

func muori():
	.muori()
	anim.play("DragonArmature|Dragon_Death")
	
	#nemico droppa le monete da morto
	var coins_scene = preload("res://DUNGEON/Scene Principali/coinBoss.tscn")
	var coin = coins_scene.instance()
	get_parent().add_child(coin)
	coin.global_transform.origin = spawnAtk.global_transform.origin
	coins_scene = coin
	var anim = coins_scene.get_node("AnimationCascata2")
	anim.play("animazioneCascata")
	$Flash.play("deathFlash")
	$Timer.start()


func attaccaWrapped():
		if(mp > 30):
			attacca(fuoco,target)
		else:
			attacca(attacco,target)
		anim.play("DragonArmature|Dragon_Attack2")


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.

func _on_Area_body_entered(body):
	if(body.is_in_group(target)):
		ready2Attack = true

func _on_Area_body_exited(body):
	if(body.is_in_group(target)):
		ready2Attack = false
