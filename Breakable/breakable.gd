extends RigidBody2D

@export var score_value: int = 100
@export var combo_value: int = 100
@export var combo_threshold: int = 0

@onready var rigidbody_collision_shape = $CollisionShape2D

signal broken(score_value, combo_value)

func _ready():
	rigidbody_collision_shape.set_deferred("disabled", true)

func _on_area_2d_body_entered(body):
	if body.combo_level >= combo_threshold:
		broken.emit(score_value, combo_value)
		self.queue_free()
	else:
		$AudioStreamPlayer.play()
		rigidbody_collision_shape.set_deferred("disabled", false)

func _physics_process(_delta):
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
