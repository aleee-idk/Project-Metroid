extends "res://Assets/Scripts/StateMachine/StateMachine.gd"

onready var animPlayer: AnimationPlayer

func _ready():
	states = {
		"Idle"		: 	$Idle,
		"Moving"	:	$Moving,
		"Jumping"	: 	$Jumping,
		"WallSlide"	:	$WallSlade
	}

	.set_active(true)
	change_state("Idle")

func change_state(newState):
	.change_state(newState)