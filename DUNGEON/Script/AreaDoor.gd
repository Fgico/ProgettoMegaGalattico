extends Area

var areaEntered = false
var doorOpen = false

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if areaEntered == true:
			
			if doorOpen == false:
				$rotPoint.rotate_y(rad2deg(90))
				doorOpen = true
				
			elif doorOpen == true:
				$rotPoint.rotate_y(rad2deg(-90))

func _ready():
	pass


func _on_AreaDoor_body_entered(body):
	if body.name == "Player":
		areaEntered = true



func _on_AreaDoor_body_exited(body):
	if body.name == "Player":
		areaEntered = false
