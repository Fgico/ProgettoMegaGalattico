extends KinematicBody
var velocity = Vector3(0,0,0)
var hordir = Vector2()
export var speed = 800
var spin = 0.1
var animPlayer
var cam


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
		elif event.relative.x < 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
#		if event.relative.y > 0:
#			cam.rotate_x(lerp(0, spin, event.relative.y/10))
#		elif event.relative.y < 0:
#			cam.rotate_x(lerp(0, spin, event.relative.y/10))
#

func tasti():
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("su"):
		velocity += transform.basis.z
	if Input.is_action_pressed("giu"):
		velocity += -transform.basis.z
	if Input.is_action_pressed("destra"):
		velocity += -transform.basis.x 
	if Input.is_action_pressed("sinistra"):
		velocity += transform.basis.x
	velocity = velocity.normalized() * speed
	velocity.y = vy

func _physics_process(delta):
	tasti()
	if(not self.is_on_floor() and velocity.y<100):
		velocity.y += - 98*delta
	else:
		velocity.y = 0
	velocity.x = velocity.x * delta
	velocity.z = velocity.z*delta
	if(is_moving()):
		animPlayer.play("run")
	else:
		animPlayer.play("idle")
	move_and_slide(velocity,Vector3.UP,true, 4, 1)


func _ready():
	cam = get_node("target/Camera")
	animPlayer = get_node("hunk/AnimationPlayer")
	pass # Replace with function body.


func is_moving():
	return velocity.x != 0 or velocity.z != 0
