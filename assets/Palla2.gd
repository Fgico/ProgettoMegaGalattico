extends KinematicBody

var velocity = Vector3() #stiamo lavorando in 3 dimensioni quindi ho bisogno di 3 vettori (x,y,z)
const SPEED = 5
const DEG = 10

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"): #se premo sinistra e destra contemporaneamente
		velocity.x = 0                                                             #fermati
	elif Input.is_action_pressed("ui_left"):                                       #se premo il tasto "freccia sinistra"
		velocity.x = -SPEED                                                        #muoviti sull'asse delle x (negative)
		$MeshInstance.rotate_z(deg2rad(DEG))
	elif Input.is_action_pressed("ui_right"):   
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-DEG))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)                                      #se non premo nulla, rallenta. (from,to,%)
	
	
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_up"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(DEG))
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-DEG))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	
	move_and_slide(velocity)
