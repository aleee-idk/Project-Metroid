extends Area2D

onready var player = $'../KinematicBody2D/Pivot'
func _ready():
	self.connect("body_entered", player, "_on_body_entered", [self])
	
