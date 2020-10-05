extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var velocity = Vector2()
	
	#aggiorno il vettore velocity in base all'input del giocatore 
	if Input.is_key_pressed(KEY_UP):
		velocity.y = -2
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y = +2
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x = -2
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x = +2
	
	var movement = 250*velocity.normalized()*delta
	
	self.move_and_collide(movement)
	
	self.update_animations(velocity)


func update_animations(velocity):
	if velocity.y == 2:
		$Rosso.play("walk_down")
	elif velocity.y == -2:
		$Rosso.play("walk_up")
	elif velocity.x == -2:
		$Rosso.play("walk_left")
		$Rosso.flip_h = false
	elif velocity.x == 2:
		$Rosso.play("walk_left")
		$Rosso.flip_h = true
	
	#stand_down vale zero come il vettore nullo ossia Vector2
	if velocity == Vector2():
		if $Rosso.animation == 'walk_down':
			$Rosso.play("stand_down")
		if $Rosso.animation == 'walk_up':
			$Rosso.play("stand_up")
		if $Rosso.animation == 'walk_left':
			$Rosso.play("stand_left")

