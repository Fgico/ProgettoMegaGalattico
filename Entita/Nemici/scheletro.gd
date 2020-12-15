extends Nemico


func _ready():
	attacco = load("res://Entita/Attacchi/fisico/SwordSlash.tscn")
	self.iniziaStats(1.5,1,20,1,300)
	anim = get_node("rotable/mesh/AnimationPlayer")
	get_parent().contaNemici += 1
	print("nasce scheletro: ", get_parent().contaNemici)



func _physics_process(delta):
		.physics_process(delta)
		if (stato == Moving ):
			anim.play("SkeletonArmature|Skeleton_Running")



func muori():
	.muori()
	get_parent().contaNemici -=1
	print("muore scheletro: ", get_parent().contaNemici)
	anim.play("SkeletonArmature|Skeleton_Death")
	
	#nemico droppa le monete da morto
	var coins_scene = preload("res://DUNGEON/Scene Principali/coinEnemy.tscn")
	var coin = coins_scene.instance()
	get_parent().add_child(coin)
	coin.global_transform.origin = spawnAtk.global_transform.origin
	coins_scene = coin
	var anim = coins_scene.get_node("AnimationCascata")
	anim.play("animazioneCascata")
	$Flash.play("deathFlash")
	$Timer.start()



func _on_Area_body_entered(body):
	if(not morto and stunned <=1 and not force):
		if(body.is_in_group(target)):
			attacca(attacco,target)
			anim.play("SkeletonArmature|Skeleton_Attack")


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
