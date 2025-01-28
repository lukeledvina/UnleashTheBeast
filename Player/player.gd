extends CharacterBody2D

@onready var camera: Camera2D = $Camera2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player = $AnimationPlayer

var can_control: bool = true

var speed: int = 150
var acceleration: float = 0.1
var drift_speed: float = 1.5
var turn_speed: float = 0.75
var friction: float = 0.01
var combo_level: int = 0

@export var drifting: bool = false


func _physics_process(_delta) -> void:
	if can_control:
		var input_direction = Input.get_vector("left", "right", "up", "down")
		#velocity = input_direction.rotated(deg_to_rad(rotation_degrees)) * max_speed
		if Input.is_action_pressed("drift"):
			input_direction.y = 0
			drift(input_direction.x)
			animation_player.play("jump")
		elif input_direction.x != 0:
			animation_player.play("walk")
			drifting = false
			if input_direction.y == 0:
				input_direction.y = -1
			rotation_degrees += turn_speed * input_direction.x
			input_direction = input_direction.normalized()
			velocity = velocity.lerp(input_direction.rotated(deg_to_rad(rotation_degrees)) * speed, acceleration)
		elif input_direction.y != 0:
			drifting = false
			animation_player.play("walk")
			velocity = velocity.lerp(input_direction.rotated(deg_to_rad(rotation_degrees)) * speed, acceleration)
		else:
			drifting = false
			animation_player.play("walk")
			velocity = velocity.lerp(Vector2.ZERO, friction)
		
		if drifting:
			animation_player.stop()

	move_and_slide()
	

func change_speed() -> void:
	match combo_level:
		0:
			speed = 150
		1:
			speed = 175
		2:
			speed = 200
		3:
			speed = 225
		4: 
			speed = 250
		5:
			speed = 275


func drift(direction) -> void:
	rotation_degrees += drift_speed * direction
