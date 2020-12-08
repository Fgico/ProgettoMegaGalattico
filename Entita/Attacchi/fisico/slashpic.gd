extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var showupWhen = 0.2
var showupTime = 0.3


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.



func _process(delta):
	showupWhen -= delta
	if (showupWhen <= 0):
		self.show()
	
	if(self.visible == true):
		showupTime -= delta
		self.opacity = showupTime * 3
		
