extends "res://Assets/Scripts/StateMachine/State.gd"


func enter():
	# owner.get_node("Anim").play("Idle") descomentar cuando tenga anim
	pass

func handle_input(event):
	if Input.is_action_just_pressed("ui_jump"):
		emit_signal("finished", "Jumping")

func update(delta):

	owner.move()

	if owner.direction.x != 0:
		emit_signal("finished", "Moving")
		
	if !owner.is_on_floor():
		emit_signal("finished", "Falling")

