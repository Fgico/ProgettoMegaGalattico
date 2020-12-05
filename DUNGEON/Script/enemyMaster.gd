extends Node

var thread
var lock
var semaphore
var mutex

onready var player = get_parent().get_parent().get_parent().get_node("player")
onready var nav = get_node("Navigation")
var proseguo = true

var figli = []

func _ready():
	thread = Thread.new()
	semaphore = Semaphore.new()
	mutex = Mutex.new()
	thread.start(self, "distribuisciPath",0)
	pass # Replace with function body.

func fine():
	proseguo = false
	thread.wait_to_finish()

func distribuisciPath(boh):
	while(proseguo):
		for figlio in figli:
			if( not proseguo):
				return
			if(player!= null):
				var from = nav.get_closest_point(figlio.global_transform.origin)
				var to = nav.get_closest_point(player.global_transform.origin)
				var path = nav.get_simple_path(from,to)
				figlio.pathlock.lock()
				figlio.path = path
				figlio.pathlock.unlock()
