extends "res://scripts/Enemy.gd"

var locked_target: Vector2

func _ready():
	actions.append(move.new("idle"))
	actions.append(move.new("Atack"))
	
	moveEnd()

func locktarget():
	locked_target = target.position
	pass

func shoot():
	#var instance = progectile
	pass
