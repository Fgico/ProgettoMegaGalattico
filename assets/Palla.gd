extends KinematicBody

var velocity = Vector3() #stiamo lavorando in 3 dimensioni quindi ho bisogno di 3 vettori (x,y,z)

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"): #se premo sinistra e destra contemporaneamente
		velocity.x = 0                                                             #fermati
	elif Input.is_action_pressed("ui_left"):                                       #se premo il tasto "freccia sinistra"
		velocity.x = -5                                                            #muoviti sull'asse delle x (negative)
	elif Input.is_action_pressed("ui_right"):   
		velocity.x = 5
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)                                      #se non premo nulla, rallenta. (from,to,%)
	
	
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_up"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.z = 5
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -5
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	
	move_and_slide(velocity)
