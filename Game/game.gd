extends Node2D

var total_score: int = 0
@onready var breakables = $Level/BreakableContainer.get_children()

@onready var combo_manager = $ComboManager

func _ready():
	for breakable in breakables:
		breakable.connect("broken", _on_breakable_broken)

func _on_breakable_broken(score):
	total_score += score
	combo_manager.increase_combo(score)
