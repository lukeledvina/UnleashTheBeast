extends CanvasLayer

@onready var score_label = $Control/VBoxContainer/ScoreLabel
@onready var combo_level_label = $Control/VBoxContainer/ComboLevelLabel
@onready var combo_progress_label = $Control/VBoxContainer/ComboProgressLabel

func update_score_label(score):
	score_label.text = "Score: " + str(score)

func update_combo_labels(combo_progress, combo_level):
	combo_level_label.text = "Rage Level: " + str(combo_level)
	combo_progress_label.text = "Rage Progress: " + str(combo_progress)
