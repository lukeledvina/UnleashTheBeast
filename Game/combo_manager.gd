extends Node2D

@onready var combo_timeout_timer: Timer = $ComboTimeoutTimer

signal combo_timeout_signal()

var combo_progress: int = 0
var combo_breakpoint: int = 1000
var combo_level: int = 0
var max_combo_level: int = 5
var min_combo_level: int = 0

var combo_timeout: bool = false

func increase_combo(combo_value: int) -> void:
	combo_progress += combo_value
	if combo_progress >= combo_breakpoint:
		combo_level = min(combo_level + 1, max_combo_level)
		combo_progress = 0
	
	combo_timeout = false
	combo_timeout_timer.stop()
	combo_timeout_timer.start()

# have some way to decrease combo if not destroying quick enough


func _on_combo_timeout_timer_timeout():
	combo_timeout = true

func _process(delta):
	if combo_timeout:
		combo_progress -= 10 * delta

		
		if combo_level <= min_combo_level and combo_progress <= 0:
			combo_timeout = false
		elif combo_progress <= 0:
			combo_level = max(combo_level - 1, min_combo_level)
			combo_progress = combo_breakpoint
		combo_timeout_signal.emit()
