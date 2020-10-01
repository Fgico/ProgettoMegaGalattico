extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dir = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	dir = Vector2(0,0)
	tasti()
	move_and_slide(dir)
	
	
func tasti():
	if(Input.is_action_pressed("ui_right")):
		dir = Vector2(50,0)