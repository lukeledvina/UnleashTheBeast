extends CharacterBody2D

@onready var camera: Camera2D = $Camera2D
@onready var sprite: Sprite2D = $Sprite2D

var max_speed: int = 200
var min_speed: int = 100
var acceleration: float = 0.1
var rotation_speed: float = 1.5
var friction: float = 0.01


func _physics_process(_delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	#velocity = input_direction.rotated(deg_to_rad(rotation_degrees)) * max_speed
	if input_direction.y != 0:
		velocity = velocity.lerp(input_direction.rotated(deg_to_rad(rotation_degrees)) * max_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
	
	#if Input.is_action_pressed("drift"):
	drift(input_direction.x)
		


func drift(direction):
	rotation_degrees += rotation_speed * direction
