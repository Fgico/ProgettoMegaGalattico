extends KinematicBody

class_name  Combattente

var stats = {
	"maxhp" : 100,
	"maxmp" : 100,
	"atk" : 1,
	"def" : 1,
	"spd" : 350
}

var stato = 0
const Idle = 0
const Moving = 1
const Attacking = 2
const Dodging = 3

var hp = stats.maxhp
var mp = stats.maxmp

var attackTimeout

var baseAttack
var knownSpecials = [null, null, null, null]

var element

#variabili per gestire il movimento
var scalare = 1
var gravity = Vector3.DOWN * 300
var velocity = Vector3()
var jump = false
var targetDir = Vector3()

onready var rotable = get_node("rotable")
onready var spawnAtk = get_node("rotable/spawnAtk") 

func iniziaStats(natk = stats.atk, ndef = stats.def, nhp = stats.maxhp, nmp = stats.maxmp, nspd = stats.spd):
	stats.atk = natk
	stats.def = ndef
	stats.maxhp = nhp
	stats.maxmp = nmp
	stats.spd = nspd


#prende un attacco e ne crea una nuova istanza davanti al giocatore
func attacca(attacco):
	if( mp >= 0 ):			#soluzione temporanea, non si può leggere costomp prima di istanziare l'attacco
		var attacked = attacco.instance()
		get_parent().add_child(attacked)
		attacked.global_transform.origin = spawnAtk.global_transform.origin
		attacked.set_rotation(spawnAtk.get_parent().get_rotation())
		
		attackTimeout = attacked.timeout
		stato = Attacking
		
		mp -= attacked.mpCost
		attacked.danno *= stats.atk

#cosa accade se colpito
func hit(danno,element):
	stats.hp -= danno - stats.def


#imposta obiettivo verso cui muovermi e aggiorno stato 
func setTarget(newtarget : Vector3):
	if newtarget != Vector3(0,0,0):
		targetDir = newtarget
		if stato != Attacking:
			stato = Moving
	else:
		targetDir = Vector3()
		if stato != Attacking:
			stato = Idle

#scalo valori in base a velocità, delta ecc... e li metto in velocità
func finalize_direction(delta):
	var vy = velocity.y
	targetDir = targetDir.normalized()
	targetDir = targetDir * stats.spd * delta *scalare
	velocity.x += targetDir.x
	velocity.z += targetDir.z
	velocity.y = vy

func _physics_process(delta):
	var vy = velocity.y
	velocity = Vector3()
	velocity += gravity * delta
	
	if stato == Attacking:
		if(attackTimeout<=0):
			attackTimeout = 0
			if targetDir != Vector3(0,0,0):
				stato = Moving
			else:
				stato = Idle
		else:
			attackTimeout -= delta
	
	elif stato == Moving:
		finalize_direction(delta)
		var angle = atan2(targetDir.x,targetDir.z)
		var char_rot = rotable.get_rotation()
		char_rot.y = angle
		rotable.set_rotation(char_rot)
	move_and_slide(velocity, Vector3.UP,true,4,0.3)
