extends KinematicBody

class_name Moveable

#variabili di movimento
#sovrascriverli da stats spd e stats ag per combattente?
var spd = 600	#velmax
var curspd = 0
var accel = 1800		#velore aggiungibile da accel in un secondo
var friction = 1200 # decelerazione da fermo

var scalare = 1

var targetDir = Vector3()
var hordir = Vector2(0,0)
var vel = Vector3()

var gravity = Vector3.DOWN * 300
var jump = false

#gestione stati
var stato = 0
const Idle = 0
const Moving = 1

#nodo che contiene nodi interessati alla rotazione, es: mesh instance
onready var rotable = get_node("rotable")

func setTargetDir(newtarget : Vector3):
	if newtarget != Vector3(0,0,0):
		targetDir = newtarget.normalized()
		if stato == Idle or stato == Moving:
			stato = Moving
	else:
		targetDir = Vector3()
		if stato == Idle or stato == Moving:
			stato = Idle

#scalo valori in base a velocità, delta ecc... e li metto in velocity
func applyDir(delta):
	curspd = clamp(curspd + accel *delta, 0, spd)
	hordir.x = targetDir.x
	hordir.y = targetDir.z
	

#per ora non ha l'under_ score per non confoderla con il physics process di sistema
#sennò godot invece di sovrascrivere la esegue due volte per ogni nodo che eredita combattente
#da verificare se anche le altre funzioni sovrascritte hanno effetto simile, ma non pare
func physics_process(delta):
	if not is_on_floor():
		vel += gravity * delta
	
	curspd = max(curspd - friction*delta, 0)
	
	if stato == Moving:
		applyDir(delta)
		var angle = atan2(targetDir.x,targetDir.z)
		var char_rot = rotable.get_rotation()
		char_rot.y = angle
		rotable.set_rotation(char_rot)
	var dir = hordir *curspd * delta * scalare
	vel.x = dir.x
	vel.z = dir.y
	move_and_slide(vel, Vector3.UP,true,4,0.3)
