extends Label

onready var character = $'..'

func _ready():
	pass

func _physics_process(delta):
	set_text(character.states.currentState.name)
