extends Node2D

@onready var game_over_screen = $"../UI/GameOverScreen"

func _ready():
	$LoseTimer.start()


func _on_lose_timer_timeout():
	game_over_screen.final_score = $"../ScoreManager".total_score
	game_over_screen.update_labels()
	$"../UI/Control".visible = false
	$"../Player".can_control = false
	game_over_screen.visible = true
