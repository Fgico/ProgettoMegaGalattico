extends KinematicBody

var velocity = Vector3() #sto lavorando su un piano tridimensionale quindi mi servono 3 vettori (x,y,z)
const SPEED = 5
const DEG = 8

func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(DEG))
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-DEG))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_up"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-DEG))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(DEG))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	
	move_and_slide(velocity)
