extends CanvasLayer

@onready var score_label = $Control/MarginContainer/VBoxContainer/ScoreLabel
@onready var combo_level_label = $Control/MarginContainer/VBoxContainer/ComboLevelLabel
@onready var combo_progress_label = $Control/MarginContainer/VBoxContainer/ComboProgressLabel
@onready var time_remaining_label: Label = $Control/MarginContainer/TimeRemainingLabel
@onready var lose_timer: Timer = $"../FailStateManager/LoseTimer"

func update_score_label(score):
	score_label.text = "Score: " + str(score)

func update_combo_labels(combo_progress, combo_level):
	combo_level_label.text = "Rage Level: " + str(combo_level)
	combo_progress_label.text = "Rage Progress: " + str(combo_progress)
	
func _process(_delta):
	if lose_timer.time_left == 0:
		time_remaining_label.text = "2:00"
	else:
		time_remaining_label.text = "%d:%02d" % [floor(lose_timer.time_left / 60), int(lose_timer.time_left) % 60]
	$CenterContainer/GameStartTimerLabel.text = "Start: " + str(int($"../GameStartTimer".time_left + 1))
