extends Control

var main_menu_scene: PackedScene = preload("res://MainMenu/main_menu.tscn")

func update_labels():
	pass

func _on_play_again_button_pressed():
	get_tree().change_scene_to_packed(main_menu_scene)

func _on_quit_button_pressed():
	get_tree().quit()
