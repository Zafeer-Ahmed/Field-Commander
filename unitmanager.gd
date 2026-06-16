extends Node

var selected_units = []
var is_selecting = false
var selection_start: Vector2 

@onready var selection_box = $SelectionBox

func ready():
	var box = ColorRect.new()
	box.name = "SelectionBox"
	box.color = Color(0.3, 0.7, 0.9, 0.3)
	box.visible = false
	add_child(box)
