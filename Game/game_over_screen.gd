extends Control


var final_score: int = 0
var total_objects_destroyed: int = 0


func update_labels():
	$VBoxContainer/ScoreLabel.text = "Final Score: " + str(final_score)
	$VBoxContainer/DestroyedLabel.text = "Objects Destroyed: " + str(total_objects_destroyed)

func _on_play_again_button_pressed():
	print("hello")
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
