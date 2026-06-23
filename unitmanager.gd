extends Node

var selected_units = []
var is_selecting = false
var selection_start: Vector2 

@onready var selection_box = $SelectionBox

func update_selection_box():
	var mouse_pos = get_viewport().get_mouse_position()
	var rect = Rect2(selection_start, mouse_pos - selection_start)
	var box = $SelectionBox
	box.position = rect.position
	box.size = rect.size.abs()
	box.visible = true
	
func finish_selection():
	for unit in selected_units:
		unit.deselect()
	selected_units.clear()

func ready():
	var box = ColorRect.new()
	box.name = "SelectionBox"
	box.color = Color(0.3, 0.7, 0.9, 0.3)
	box.visible = false
	add_child(box)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				selection_start = get_viewport().get_mouse_position()
				is_selecting = true
			else:
				is_selecting = false
				$SelectionBox.visible = false
				finish_selection()
		elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var target = get_viewport().get_mouse_position()
			for unit in selected_units:
				unit.set_target(target)
	if event is InputEventMouseMotion and is_selecting:
		update_selection_box()
