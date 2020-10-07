extends "res://Assets/Scripts/StateMachine/State.gd"


func enter():
	# owner.get_node("Anim").play("Idle") descomentar cuando tenga anim
	pass

func handle_input(event):
	if Input.is_action_just_pressed("ui_jump"):
		if owner.is_on_floor():
			print("jumping")

func update(delta):
	if owner.direction.x != 0:
		print("moving!")
