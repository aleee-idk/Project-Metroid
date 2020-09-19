extends KinematicBody2D

# Horizontal Movement
export var aceleration = 1
export var maxSpeed = 300
export var friction = 0.1

# Vertical Movment
export var jumpForce = -1000

export onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
export var bonusGravity = 1000
export var fallMultiplier = 4
export var quickFallMultiplier = 15
var dir = 0

var velocity = Vector2()
var salto = true


func _physics_process(delta):
	velocity.y += delta * (gravity if velocity.y < 0 else gravity * 0.1)

	print(velocity.y)

	if ! Input.is_action_pressed("ui_up"):
		salto = true

	dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	# Falling multiplier
	# Falling
	if velocity.y > 0: 
		velocity.y += fallMultiplier * (gravity / 10)

	# Jumping
	elif velocity.y < 0 && !Input.is_action_pressed("ui_up"):
		velocity.y += quickFallMultiplier * (gravity/ 10)
	
	if !is_on_floor():
		velocity.y += bonusGravity * delta

	# Salto del jugador.
	if is_on_floor() && (salto && Input.is_action_just_pressed("ui_up")):
		velocity.y = jumpForce
		salto = false

	# velocity.y += gravity
	velocity.x = lerp(velocity.x, dir * maxSpeed, aceleration if dir != 0 else friction)
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
