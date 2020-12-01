extends Combattente

var scattando = 1
var inputDir = Vector2()

var attaccoBase = preload("../Attacchi/fisico/SwordSlash.tscn")
var fuoco = preload("../Attacchi/Speciali/fuoco/lanciafiamme.tscn")
var target = "enemy"

onready var anim = $rotable/mesh/AnimationPlayer
onready var cam = $target/Camera
onready var stick = $target/Camera/UI/CombatUI/movStick
onready var scattoTimer = $Timer/scatto
onready var healthBar = $target/Camera/UI/CombatUI/healthBar
onready var mpBar = $target/Camera/UI/CombatUI/mpBar

onready var screenSize = OS.get_window_size()

func _ready():
	knownSpecials = [fuoco]
	scattoTimer.stop()

#prende input per il movimento dal tocco
func _input(event):
	if event is InputEventScreenTouch and event.is_pressed() and event.position.x < screenSize.x/2:
		stick.position = event.position
		stick.show()
	if(event is InputEventScreenTouch and not event.is_pressed() and event.position.x < screenSize.x/2):
		stick.hide()
		inputDir  = Vector2(0,0)
		setTargetDir(Vector3(inputDir.x,0,inputDir.y))
	if(event is InputEventScreenDrag):
		inputDir = stick.position - event.position
		setTargetDir(Vector3(inputDir.x,0,inputDir.y))

#input ma dal pc
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
	setTargetDir(Vector3(inputDir.x,0,inputDir.y))
	
	if Input.is_action_just_pressed("attacco"):
		attaccaChecked(attaccoBase,false)
	if Input.is_action_just_pressed("scatta"):
		scatta()

#aggiorna animazioni, scatto e barra magia e richiama la "farlocca"
#physics_process della classe madre
func _physics_process(delta):
	mpBar.value = (float(mp) /stats.maxmp) *100
	
	scattando = max( 1 , scattando- delta*10)
	if(scattando<=1):
		scattando = 1
	else:
		scattando -= delta *10
	scalare = scattando
	input_pc()
	.physics_process(delta)
	if stato == Moving:
		anim.play("sword and shield run-loop")
	elif stato == Idle:
		anim.play("sword and shield idle-loop")

#piccolo wrap per gli attacchi con animazioni e controllo che non si stia già attaccando
func attaccaChecked(attacco,isSpecial):
	if (stato != Attacking):
		.attacca(attacco,target)
		if isSpecial:
			anim.play("sword and shield casting 2-loop")
		else:
			anim.play("sword and shield slash-loop")
			anim.advance(0.5)

#scattando e uno scalare della velocita che diminuisce di 1 al secondo
#il timer tiene conto di quando poter riscattare
func scatta():
	if (scattando <= 1 and scattoTimer.is_stopped()):
		scattando = 4;
		scattoTimer.start()

func hit(danno, elemento):
	.hit(danno, elemento)
	healthBar.value = (float(hp)/stats.maxhp) * 100

func muori():
	if(stato != Dead):
		anim.play("sword and shield death-loop")
		anim.get_animation("sword and shield death-loop").loop = false
	stato = Dead
func _on_scatto_timeout():
	scattoTimer.stop()
	pass # Replace with function body.

