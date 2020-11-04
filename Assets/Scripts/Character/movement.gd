extends KinematicBody2D

onready var states = $StateMachine

# Horizontal Movement
export var aceleration = 1
export var maxSpeed = 300
export var friction = 0.1

# Vertical Movment
export var jumpForce = -1000
export var wallFriction = 100 
export var maxWallSpeed = 300

export onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
export var bonusGravity = 1000
export var fallMultiplier = 4
export var quickFallMultiplier = 15
var direction = Vector2()

var velocity = Vector2()
var salto = true


func _physics_process(delta):
	velocity.y += (delta * gravity)

	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down")

	# velocity.y += gravity
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
	# print(states.currentState.name)
	print(velocity)

func move():
	velocity.x = lerp(velocity.x, direction.x * maxSpeed, aceleration if direction.x != 0 else friction)

func jump():
	velocity.y = jumpForce 
