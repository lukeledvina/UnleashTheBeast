extends Node2D

@onready var ui = $UI
@onready var score_manager = $ScoreManager
var total_score: int = 0
@onready var breakables = $Level/BreakableContainer.get_children()

@onready var combo_manager = $ComboManager

func _ready():
	for breakable in breakables:
		breakable.connect("broken", _on_breakable_broken)
	combo_manager.connect("combo_timeout_signal", _on_combo_timeout)

func _on_breakable_broken(score):
	score_manager.increase_score(score)
	combo_manager.increase_combo(score)
	ui.update_score_label(score_manager.total_score)
	ui.update_combo_labels(combo_manager.combo_progress, combo_manager.combo_level)

func _on_combo_timeout():
	ui.update_combo_labels(combo_manager.combo_progress, combo_manager.combo_level)
