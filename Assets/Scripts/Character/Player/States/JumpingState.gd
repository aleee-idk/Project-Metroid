extends "res://Assets/Scripts/StateMachine/State.gd"

func enter():
	# owner.get_node("Anim").play("Idle") descomentar cuando tenga anim
	owner.jump()
	return

func handle_input(event):
	pass


func update(delta):
	owner.move()

	if !Input.is_action_pressed("ui_jump"):
		emit_signal("finished", "Falling")
	else:
		owner.velocity.y += (owner.fallMultiplier * (owner.gravity / 10))
	# Falling
	# if owner.velocity.y > 0:
	# 	emit_signal("finished", "Falling")
	# 	return

	if owner.is_on_floor():
		emit_signal("finished", "Idle")
		return
