extends CharacterBody2D

@onready var camera: Camera2D = $Camera2D

const speed: int = 200


func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction.rotated(deg_to_rad(rotation_degrees)) * speed
	move_and_slide()
	
	if Input.is_action_pressed("drift"):
		drift(input_direction.x)
		


func drift(direction):
	rotation_degrees += 1 * direction

func _process(delta):
	pass
