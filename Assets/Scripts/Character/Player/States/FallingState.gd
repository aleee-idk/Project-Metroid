extends "res://Assets/Scripts/StateMachine/State.gd"

func enter():
	# owner.get_node("Anim").play("Idle") descomentar cuando tenga anim
	pass

func handle_input(event):
	pass


func update(delta):

	owner.velocity.y += (owner.quickFallMultiplier * (owner.gravity/ 10))
	owner.move()

	if owner.is_on_floor():
		emit_signal("finished", "Idle")
		return delta
