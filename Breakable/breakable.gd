extends Area2D

var score_value: int = 100

signal broken(score_value)


func _on_body_entered(body):
	broken.emit(score_value)
	self.queue_free()
