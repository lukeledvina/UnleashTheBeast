extends Area2D

@export var score_value: int = 100
@export var combo_value: int = 100
@export var combo_threshold: int = 0

signal broken(score_value, combo_value)


func _on_body_entered(body):
	if body.combo_level >= combo_threshold:
		broken.emit(score_value, combo_value)
		self.queue_free()
