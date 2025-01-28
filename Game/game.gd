extends Node2D

@onready var ui = $UI
@onready var score_manager = $ScoreManager
@onready var player = $Player
var total_score: int = 0
@onready var breakables = $Level/BreakableContainer.get_children()
@onready var game_over_screen = $UI/GameOverScreen

@onready var combo_manager = $ComboManager

func _ready():
	for breakable in breakables:
		breakable.connect("broken", _on_breakable_broken)
	combo_manager.connect("combo_timeout_signal", _on_combo_timeout)

func _process(_delta):
	player.combo_level = combo_manager.combo_level

func _on_breakable_broken(score_value, combo_value):
	score_manager.increase_score(score_value)
	combo_manager.increase_combo(combo_value)
	ui.update_score_label(score_manager.total_score)
	ui.update_combo_labels(combo_manager.combo_progress, combo_manager.combo_level)
	player.change_speed()
	game_over_screen.total_objects_destroyed += 1

func _on_combo_timeout():
	ui.update_combo_labels(combo_manager.combo_progress, combo_manager.combo_level)
	player.change_speed()


func _on_game_start_timer_timeout():
	player.can_control = true
	$AudioStreamPlayer.play()
	$FailStateManager/LoseTimer.start()
	$UI/CenterContainer.hide()
