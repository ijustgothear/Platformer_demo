extends CharacterBody2D

@onready var animator = $AnimationPlayer

var target: CharacterBody2D
var actions: Array
var moveIndex: int = 0

@export var Maxhealth: float
var health: float

func _process(delta):
	if target == null:
		target = get_node("/root/sean/player")

func moveEnd():
	var nextmove = randf_range(0,actions.size())
	while nextmove == moveIndex:
		nextmove = randf_range(0,actions.size())
	moveIndex = nextmove
	print(moveIndex)
	Do(actions[moveIndex])

func Do(Move: move):
	animator.play(Move.animation)
	

