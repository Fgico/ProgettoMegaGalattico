extends Nemico

var fuoco = load("res://Entita/Attacchi/Speciali/fuoco/lanciafiamme.tscn")

onready var animazione1 = get_parent().get_parent().get_node("AreaSbarre/AnimationPlayer")
onready var animazione2 = get_parent().get_parent().get_node("AreaSbarre2/AnimationPlayer")
onready var camera = get_parent().get_parent().get_node("AreaSbarre/Camera")
onready var fade = get_parent().get_parent().get_node("TransitionD1/ColorRect/AnimationFading1")
onready var camera2 = get_parent().get_parent().get_node("AreaSbarre2/Camera")
onready var fade2 = get_parent().get_parent().get_node("Transition2/ColorRect/AnimationFading2")


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


func _on_Area_body_entered(body):
	if(not morto and stunned <=1):
		if(body.is_in_group(target)):
			if(mp > 30):
				attacca(fuoco,target)
			else:
				attacca(attacco,target)
			anim.play("DragonArmature|Dragon_Attack2")



#PASSAGGIO 1°DUNGEON
func AreaSbarre_entered(body):
	if(body.is_in_group("player") and get_parent().contaNemici == 0):
		body.UI.hide()
		camera.current = true
		animazione1.play("animazioneSbarre")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(animazioneSbarre):
	fade.play("fadetoblack1")
	pass # Replace with function body.


func _on_AnimationFading1_animation_finished(fadetoblack1):
	get_tree().root.get_node("nodo_isola").cambioPiano("res://DUNGEON/Scene Principali/Dun2.tscn")
	pass # Replace with function body.



#PASSAGGIO 2°DUNGEON
func _on_AreaSbarre2_body_entered(body):
	if (body.is_in_group("player")  and get_parent().contaNemici == 0):
		body.UI.hide()
		camera2.current = true
		animazione2.play("animazioneSbarre2")
	pass # Replace with function body.

func _on_AnimationPlayer_animation2_finished(animazioneSbarre2):
	fade2.play("fadetoblack2")
	pass # Replace with function body.


func _on_AnimationFading2_animation_finished(fadetoblack2):
	get_tree().root.get_node("nodo_isola").cambioPiano("res://Isola/ISOLA_VOLANTE/Isola_volante.tscn")
	pass # Replace with function body.
