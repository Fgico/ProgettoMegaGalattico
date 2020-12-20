extends Combattente
class_name  Nemico

var attacco
var anim

var target = "player"

var path = null

var morto : bool = false
var ready2Attack : bool = false

onready var manager = get_parent()
onready var statusParticles : CPUParticles = get_node("ParticlesSpawner/CPUParticles")

const coloriParticles = {
	"fuoco" : preload("res://Entita/Attacchi/statusParticlesColors/fuoco.tres"),
	"ghiaccio" : preload("res://Entita/Attacchi/statusParticlesColors/ghiaccio.tres"),
	"elettro" : preload("res://Entita/Attacchi/statusParticlesColors/elettro.tres")
}

func _physics_process(delta):
		stunned -= delta
		if(stunned <= 0):
			anim.playback_speed = 1
		if(debuffTime<= 0):
			statusParticles.emitting = false
		if(manager.player != null):
			setTargetDir(manager.player.global_transform.origin - self.global_transform.origin)
		if(ready2Attack and stato != Attacking and manager.player.stato != Dead and not morto and stunned <=1 and not force):
			attaccaWrapped()

func attaccaWrapped():
	pass

func hit(danno,nelement,malusRate):
	if(not morto):
		if(nelement != 0 and malusRate != 0):
			if( randf() <  malusRate):
				self.debuff = nelement
				self.debuffTime = 5
				match nelement:
					1:
						statusParticles.emitting = true
						statusParticles.color_ramp = coloriParticles.fuoco
					2:
						statusParticles.emitting = true
						statusParticles.color_ramp = coloriParticles.ghiaccio
					3:
						statusParticles.emitting = true
						statusParticles.color_ramp = coloriParticles.elettro
						
			stunned = 1
		if(nelement == 0):
			var bouncedDir = (-vel).normalized()
			bouncedDir.y = 0
			setForce(bouncedDir,450,0.35)
			anim.playback_speed = 0
			stunned = 0.7
		.hit(danno,nelement,malusRate)

func muori():
	get_node("CollisionShape").disabled = true
	statusParticles.emitting = false
	morto = true
	stunned = 0
	stato = Dead
