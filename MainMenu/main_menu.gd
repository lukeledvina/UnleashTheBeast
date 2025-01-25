extends Control

var city_level: PackedScene = preload("res://Game/game.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(city_level)

func _on_options_button_pressed():
	pass # Replace with function body.
