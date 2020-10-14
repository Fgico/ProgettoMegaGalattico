extends KinematicBody
var gravity = Vector3.DOWN * 18  # strength of gravity

export var speed = 3  # movement speed

export var jump_speed = 6  # jump strength

var spin = 0.1  # rotation speed


var velocity = Vector3()
var jump = false

var anim
var cam

func _ready():
	anim = get_node("mesh/AnimationPlayer")
	cam = get_node("target/Camera")


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
		elif event.relative.x < 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))

func get_input():
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("giu"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("su"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("sinistra"):
		velocity += transform.basis.x * speed
	if Input.is_action_pressed("destra"):
		velocity += -transform.basis.x * speed
	velocity.y = vy
	jump = false
	if Input.is_action_just_pressed("jump"):
		jump = true

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP,true,4,0.5)
	if (is_on_floor() or is_on_wall()):
		if jump:
			velocity.y = jump_speed
			anim.play("sword and shield jump 2-loop")
			anim.advance(0.2)
		elif is_moving():
			anim.play("sword and shield run-loop")
		else:
			anim.play("sword and shield idle-loop")

func is_moving():
	return velocity.x != 0 and velocity.z!=0


