extends Node2D

var total_score: int = 0


func _ready():
	var breakables = $Level/Breakables.get_children()
	for breakable in breakables:
		breakable.connect("broken", _on_breakable_broken)
		print("sup")


func _on_breakable_broken(score):
	total_score += score
	print(total_score)
