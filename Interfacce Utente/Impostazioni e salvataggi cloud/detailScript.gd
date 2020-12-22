extends Node

func _ready():
	if(not userData.settings.details):
		self.queue_free()
