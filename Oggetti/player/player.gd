extends Combattente
var gravity = Vector3.DOWN * 18  # strength of gravity

export var speed = 100  # movement speed
var scattando = 1

var velocity = Vector3()
var jump = false
var dir = Vector2(0,0)

var attacco = preload("../Attacchi/interazione.tscn")
onready var rotable = get_node("rotable")
onready var anim = get_node("rotable/mesh/AnimationPlayer")
onready var cam = get_node("target/Camera")
onready var stick = get_node("target/Camera/UI/movStick")
var pacific = true
#func _ready():



#func _unhandled_input(event):
#	if event is InputEventScreenTouch and event.is_pressed():
#		stick.position = event.position
#		stick.show()
#	if(event is InputEventScreenTouch and not event.is_pressed()):
#		stick.hide()
#		dir  = Vector2(0,0)
#	if(event is InputEventScreenDrag):
#		dir = stick.position - event.position

func input_pc():
	dir = Vector2(0,0)
	if( Input.is_action_pressed("sinistra")):
		dir.x+= 1
	elif(Input.is_action_pressed("destra")):
		dir.x += -1
	if(Input.is_action_pressed("su")):
		dir.y += 1
	elif(Input.is_action_pressed("giu")):
		dir.y += -1
	if(Input.is_action_just_pressed("attacco")):
		attacca(attacco)
	if (Input.is_action_just_pressed("scatta") and scattando <= 1):
		scattando = 5
	
func get_input(delta):
	var vy = velocity.y
	velocity = Vector3()
	dir = dir.normalized()
	dir = dir * speed *scattando * delta
	velocity.x += dir.x
	velocity.z += dir.y
	velocity.y = vy

func _physics_process(delta):
	if(scattando<=1):
		scattando = 1
	else:
		scattando -= delta *10
	velocity += gravity *delta
	input_pc()
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP,true,4,0.3)
	if is_moving():
		anim.play("sword and shield run-loop")
		var angle = atan2(dir.x,dir.y)
		var char_rot = rotable.get_rotation()
		char_rot.y = angle
		rotable.set_rotation(char_rot)
	else:
		anim.play("sword and shield idle-loop")

func is_moving():
	return abs(velocity.x) > 0.1 or abs(velocity.z) > 0.1




func _on_attacco_pressed():
	attacca(attacco)
	pass # Replace with function body.
