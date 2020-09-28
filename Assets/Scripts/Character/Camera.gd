extends Position2D


onready var character = $'..'
onready var camera = $'Camara offset/Camera2D'
export var xOffset = 100
export var yOffset = 100
var camara = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	update_pivot_angle()

func _physics_process(delta):
	update_pivot_angle()

func update_pivot_angle():
	position = Vector2(xOffset * character.direction.x,yOffset * character.direction.y)

func _on_body_entered(body, Area2D):
	#print(Area2D.get_global_position())
	var center = Area2D.get_global_position()
	var limits = Area2D.get_node('CollisionShape2D').get_shape().get_extents()

	camera.set_limit(0, center.x - limits.x)
	camera.set_limit(1, center.y - limits.y)
	camera.set_limit(2, center.x + limits.x)
	camera.set_limit(3, center.y + limits.y)
