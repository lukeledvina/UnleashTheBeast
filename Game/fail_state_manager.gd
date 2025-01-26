extends Node2D

var game_over_screen: PackedScene = preload("res://Game/game_over_screen.tscn")

func _ready():
	$LoseTimer.start()


func _on_lose_timer_timeout():
	get_tree().change_scene_to_packed(game_over_screen)
