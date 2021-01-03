extends Moveable

class_name  Combattente

var stats = {
	"maxhp" : 100,
	"maxmp" : 100,
	"atk" : 1,
	"def" : 1,
	"spd" : 600
}

#in ordine: elmetto, petto, pantaloni, scarpe
var armorStats = [0, 0, 0, 0]

#si nasce in stato Idle, eredito definizione altri stati da Moveable
const Attacking = 2
const Dodging = 3	#per ora non usato

var hp = stats.maxhp
var mp = stats.maxmp

var mpRecoveryRate = 3

var attackTimeout

var curwpn		#arma equipaggiata
var curarm		#armatura equipaggiata

var baseAttack
var atkSpd = 1
var combo = 0	#per ora usata solo in player, usata per capire quanti attacchi fisici abbiamo fatto di fila
var knownSpecials = [] #lista dei quattro attacchi imparati

#lista di stati possibili
const Normal = 0
const Burnt = 1
const Freezed = 2
const Shocked = 3

var debuff = Normal
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
	hp = stats.maxhp

#prende un attacco e ne crea una nuova istanza davanti al giocatore
func attacca(attacco,target):
	if(stato != Dead):
		var attacked = attacco.instance()
		spawnAtk.add_child(attacked)
		#soluzione temporanea, non si può leggere costoMp prima di istanziare l'attacco
		#si potrebbe fare un attackDB simile a itemDB da cui leggere i dati per fixare
		if( mp > attacked.mpCost ):
	#		attacked.global_transform.origin = spawnAtk.global_transform.origin
	#		attacked.set_rotation(spawnAtk.get_parent().get_rotation())
	#codice eventualmente utile per fare proiettili, per ora no

			mp -= attacked.mpCost
			if attacked.audio != null:
				attacked.audio.play()
			attacked.perAtk(stats.atk)
			attacked.setSpd(atkSpd)
			attacked.target = target
			attackTimeout = attacked.timeout	#ci dice quando attacco è concluso
			stato = Attacking					#aggiorno stato
			return attackTimeout
		else:
			attacked.queue_free()				#fix temp: non avevo mp per evocarlo quindi me ne libero
			return 0

#cosa accade se colpito
func hit(danno,nelement,malusRate):
	var dmg = float(danno)/float(stats.def)
	hp = max(hp - dmg, 0)
	if(hp <= 0 and stato != Dead):
		muori()

func muori():
	pass
	
#per ora non ha l'under_ score per non confoderla con il physics process di sistema
#sennò godot invece di sovrascrivere la esegue due volte per ogni nodo che eredita combattente
#da verificare se anche le altre funzioni sovrascritte hanno effetto simile, ma non pare
func physics_process(delta):
	mp = min( mp + mpRecoveryRate* delta, stats.maxmp)
	
	#gestione dei debuffs, a ogni frame sottraggo delta, il tempo passato dall'ultimo frame, a debufftime,
	#se raggiunge 0 è ora di curare il Combattente
	match debuff:
		#se bruciato levo vita
		Burnt:
			hp = max(hp - delta * 3, 0)
			if(hp <= 0 and stato != Dead):
				muori()
			debuffTime = max(0, debuffTime-delta)
			if(debuffTime == 0):
				debuff = Normal
		#se raffredato mi rallento
		Freezed:
			spd = stats.spd * 0.5
			debuffTime = max(0, debuffTime-delta)
			if(debuffTime == 0):
				debuff = Normal
				spd = stats.spd
			
		Shocked:
			spd = stats.spd *0.0
			debuffTime = max(0, debuffTime-delta)
			if(debuffTime == 0):
				debuff = Normal
				spd = stats.spd
		_:
			pass
	
	#se sto attacando finisco l'attacco
	if stato == Attacking:
		if(attackTimeout<=0):
			attaccoFinito()
		else:
			attackTimeout -= delta
	#eseguo la routine di movimento da moveable
	.physics_process(delta)

func attaccoFinito():
	attackTimeout = 0
	combo = 0
	if targetDir != Vector3.ZERO:
		stato = Moving
	else:
		stato = Idle
	
