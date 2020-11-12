extends Moveable

class_name  Combattente

var stats = {
	"maxhp" : 100,
	"maxmp" : 100,
	"atk" : 1,
	"def" : 1,
	"spd" : 600
}

#si nasce in stato Idle, eredito definizione altri stati da Moveable
const Attacking = 2
const Dodging = 3	#per ora non usato

var hp = stats.maxhp
var mp = stats.maxmp

var mpRecoveryRate = 3

var attackTimeout

var baseAttack
var knownSpecials = [] #lista dei quattro attacchi imparati

#lista di stati possibili
const Niente = 0
const Fuoco = 1
const Ghiaccio = 2
var debuff = Niente
var debuffTime = 0

var element #ancora non usato

#necessari per gestire la rotazione della mesh e spawnare l'attacco con la giusta rotazione
onready var spawnAtk = get_node("rotable/spawnAtk") 

#inizializza le stat, stavolta usando i dati nel dizionario di sopra
func iniziaStats(natk = stats.atk, ndef = stats.def, nhp = stats.maxhp, nmp = stats.maxmp, nspd = stats.spd):
	stats.atk = natk
	stats.def = ndef
	stats.maxhp = nhp
	stats.maxmp = nmp
	stats.spd = nspd
	spd = stats.spd

#prende un attacco e ne crea una nuova istanza davanti al giocatore
func attacca(attacco):
	var attacked = attacco.instance()
	spawnAtk.add_child(attacked)
	#soluzione temporanea, non si può leggere costoMp prima di istanziare l'attacco
	if( mp > attacked.mpCost ):
#		attacked.global_transform.origin = spawnAtk.global_transform.origin
#		attacked.set_rotation(spawnAtk.get_parent().get_rotation())
		#l attacco copia posizione e rotazione personaggio

		attackTimeout = attacked.timeout	#ci dice quando attacco è concluso
		stato = Attacking					#aggiorno stato

		mp -= attacked.mpCost
		attacked.danno *= stats.atk
	else:
		attacked.queue_free()				#fix temp: non avevo mp per evocarlo quindi me ne libero


#cosa accade se colpito
func hit(danno,element):
	stats.hp = min(danno - stats.def,0)

#per ora non ha l'under_ score per non confoderla con il physics process di sistema
#sennò godot invece di sovrascrivere la esegue due volte per ogni nodo che eredita combattente
#da verificare se anche le altre funzioni sovrascritte hanno effetto simile, ma non pare
func physics_process(delta):
	mp = min( mp + mpRecoveryRate* delta, stats.maxmp)
	
	#gestione dei debuffs
	match debuff:
		Fuoco:
			hp -= delta
			debuffTime = max(0, debuffTime-delta)
			if(debuffTime == 0):
				debuff = Niente
		Ghiaccio:
			spd = stats.spd * 0.8
			debuffTime = max(0, debuffTime-delta)
			if(debuffTime == 0):
				debuff = Niente
				spd = stats.spd
		_:
			pass
	
	#se sto attacando finisco l'attacco
	if stato == Attacking:
		if(attackTimeout<=0):
			attackTimeout = 0
			if targetDir != Vector3(0,0,0):
				stato = Moving
			else:
				stato = Idle
		else:
			attackTimeout -= delta
	#eseguo la routine di movimento da moveable
	.physics_process(delta)
