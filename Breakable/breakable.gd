extends Area2D

var score_value: int = 100

signal broken(score_value)

func _on_area_entered(_area):
	emit_signal("broken", score_value)
	queue_free()
