extends "res://Assets/Scripts/StateMachine/State.gd"


func enter():
	# owner.get_node("Anim").play("Idle") descomentar cuando tenga anim
    pass

func handle_input(event):
    if Input.is_action_just_pressed("ui_jump"):
        owner.velocity.y = 0
        emit_signal("finished", "Jumping")

func update(delta):
    owner.move()

    if abs(owner.velocity.x) < 1:
        emit_signal("finished", "Idle")

    if !owner.is_on_floor():
        emit_signal("finished", "Falling")
