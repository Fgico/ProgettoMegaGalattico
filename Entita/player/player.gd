extends Combattente

var scattando = 1
var inputDir = Vector2()

#var attacco = preload("../Attacchi/interazione.tscn")
var attacco = preload("../Attacchi/Speciali/fuoco/lanciafiamme.tscn")
onready var anim = get_node("rotable/mesh/AnimationPlayer")
onready var cam = get_node("target/Camera")
onready var stick = get_node("target/Camera/UI/CombatUI/movStick")
onready var scattoTimer = get_node("Timer/scatto")
onready var healthBar = get_node("target/Camera/UI/CombatUI/healthBar")
onready var mpBar = get_node("target/Camera/UI/CombatUI/mpBar")

onready var screenSize = OS.get_window_size()

func _ready():
	scattoTimer.stop()

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed() and event.position.x < screenSize.x/2:
		stick.position = event.position
		stick.show()
	if(event is InputEventScreenTouch and not event.is_pressed() and event.position.x < screenSize.x/2):
		stick.hide()
		inputDir  = Vector2(0,0)
		setTarget(Vector3(inputDir.x,0,inputDir.y))
	if(event is InputEventScreenDrag):
		inputDir = stick.position - event.position
		setTarget(Vector3(inputDir.x,0,inputDir.y))

func input_pc():
	inputDir = Vector2(0,0)
	if( Input.is_action_pressed("sinistra")):
		inputDir.x+= 1
	elif(Input.is_action_pressed("destra")):
		inputDir.x += -1
	if(Input.is_action_pressed("su")):
		inputDir.y += 1
	elif(Input.is_action_pressed("giu")):
		inputDir.y += -1
	setTarget(Vector3(inputDir.x,0,inputDir.y))
	
	if Input.is_action_just_pressed("attacco"):
		attaccaChecked(attacco,true)
	if Input.is_action_just_pressed("scatta"):
		scatta()


func _physics_process(delta):
	if(scattando<=1):
		scattando = 1
	else:
		scattando -= delta *10
	scalare = scattando
#	input_pc()
	._physics_process(delta)
	if stato == Moving:
		anim.play("sword and shield run-loop")
	elif stato == Idle:
		anim.play("sword and shield idle-loop")

func attaccaChecked(attacco,isSpecial):
	if (stato != Attacking):
		.attacca(attacco)
		if isSpecial:
			anim.play("sword and shield casting 2-loop")
			mpBar.value = (float(mp) /stats.maxmp) *100
		else:
			anim.play("sword and shield slash-loop")
			anim.advance(0.5)

func scatta():
	if (scattando <= 1 and scattoTimer.is_stopped()):
		scattando = 3.5;
		scattoTimer.start()

func hit(danno, elemento):
	.hit(danno, elemento)
	healthBar.value = (float(hp)/stats.maxhp) * 100

func _on_scatto_timeout():
	scattoTimer.stop()
	pass # Replace with function body.

