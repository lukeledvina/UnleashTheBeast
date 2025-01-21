extends CanvasLayer

@onready var score_label = $Control/VBoxContainer/ScoreLabel
@onready var combo_level_label = $Control/VBoxContainer/ComboLevelLabel
@onready var combo_progress_label = $Control/VBoxContainer/ComboProgressLabel

func update_score_label(score):
	score_label.text = "Score: " + str(score)

func update_combo_labels():
	pass