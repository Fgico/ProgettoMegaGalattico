extends Attacco

onready var slash = get_node("Sprite3D")
onready var shape = get_node("CollisionShape")

var showupWhen = 0.15
var showupTime = 0.3

func _ready():
	iniziaStats(12,0,0,0.8)
	audio = get_node("AudioStreamPlayer")
	pass 

func _process(delta):
	showupWhen -= delta
	if (showupWhen <= 0 and slash.visible == false):
		slash.show()
		shape.disabled = false
	
	if(slash.visible == true):
		showupTime -= delta
		slash.opacity = showupTime * 3

func setSpd(spd):
	timeout *= spd
	showupWhen *= spd
	showupTime *= spd

func perAtk(atk):
	danno *= atk

func _on_Area_body_entered(body):
	hit(body)
	pass # Replace with function body.
