extends CharacterBody2D

const speed: int = 200

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity.x = input_direction * speed
	move_and_slide()

func _process(delta):
	pass
