extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var JUMP_TIME = 0.5
var Jump_timer

@onready var animater = $AnimationPlayer
@onready var sprite = $Sprite2D 

var freaze = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_pressed("Z_button"):
		if Jump_timer > 0:
			velocity.y = JUMP_VELOCITY
			Jump_timer -= delta
			animater.play("jump") 
	elif is_on_floor():
		Jump_timer = JUMP_TIME
	else:
		Jump_timer = 0

	if Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		if is_on_floor():
			animater.play("run")

	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		if is_on_floor():
			animater.play("run")

	var direction = Input.get_axis("ui_left", "ui_right")
	if !freaze:
		velocity.x = move_toward(velocity.x,direction * SPEED, SPEED * 0.2)
	
	if velocity.x == 0:
		if is_on_floor():
			animater.play("idle")
		
	move_and_slide()
