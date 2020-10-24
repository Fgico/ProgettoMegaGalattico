extends KinematicBody

class_name  Combattente

var stats = {
	"maxhp" : 100,
	"maxmp" : 100,
	"atk" : 1,
	"def" : 1,
	"spd" : 600
}
var hp = stats.maxhp
var mp = stats.maxmp
var knownAttacks =[null, null, null, null]

<<<<<<< HEAD
var element

=======
#si nasce in stato Idle
var stato = 0
const Idle = 0
const Moving = 1
const Attacking = 2
const Dodging = 3	#per ora non usato

var hp = stats.maxhp
var mp = stats.maxmp

var mpRecoveryRate = 3

var attackTimeout

var baseAttack
var knownSpecials = [] #lista dei quattro attacchi imparati

var element #ancora non usato del tutto

#variabili per gestire il movimento
var scalare = 1
var gravity = Vector3.DOWN * 300
var velocity = Vector3()
var jump = false
var targetDir = Vector3()

#necessari per gestire la rotazione della mesh e spawnare l'attacco con la giusta rotazione
onready var rotable = get_node("rotable")
>>>>>>> main
onready var spawnAtk = get_node("rotable/spawnAtk") 

#inizializza le stat, stavolta usando i dati nel dizionario di sopra
func iniziaStats(natk = stats.atk, ndef = stats.def, nhp = stats.maxhp, nmp = stats.maxmp, nspd = stats.spd):
	stats.atk = natk
	stats.def = ndef
	stats.maxhp = nhp
	stats.maxmp = nmp
	stats.spd = nspd

<<<<<<< HEAD
=======

>>>>>>> main
#prende un attacco e ne crea una nuova istanza davanti al giocatore
func attacca(attacco):
	var attacked = attacco.instance()
	get_parent().add_child(attacked)
	#soluzione temporanea, non si può leggere costoMp prima di istanziare l'attacco
	if( mp > attacked.mpCost ):
		attacked.global_transform.origin = spawnAtk.global_transform.origin
		attacked.set_rotation(spawnAtk.get_parent().get_rotation())
		#l attacco copia posizione e rotazione personaggio

		attackTimeout = attacked.timeout	#ci dice quando attacco è concluso
		stato = Attacking					#aggiorno stato

		mp -= attacked.mpCost
		attacked.danno *= stats.atk
	else:
		attacked.queue_free()				#fix temp: non avevo mp per evocarlo quindi me ne libero


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

#scalo valori in base a velocità, delta ecc... e li metto in velocity
func finalize_direction(delta):
	var vy = velocity.y
	targetDir = targetDir.normalized()
	targetDir = targetDir * stats.spd * delta *scalare
	velocity.x += targetDir.x
	velocity.z += targetDir.z
	velocity.y = vy


#per ora non ha l'under_ score per non confoderla con il physics process di sistema
#sennò godot invece di sovrascrivere la esegue due volte per ogni nodo che eredita combattente
#da verificare se anche le altre funzioni sovrascritte hanno effetto simile, ma non pare
func physics_process(delta):
	if( mp > stats.maxmp):
		mp = stats.maxmp
	else:
		mp += delta * mpRecoveryRate
	
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
