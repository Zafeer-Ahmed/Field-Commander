extends Area2D


#Neurtal:0 player:1 enemy:2
var is_captured = false
var owner_faction = 0

var color_neutral = Color("#C4B9A8")
var color_player = Color("#8B7355")
var color_enemy = Color("#5C6B73")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_color()

func update_color():
	var polygon = $Polygon2D
	match owner_faction:
		0: polygon.color = color_neutral
		1: polygon.color = color_player
		2: polygon.color = color_enemy
		
func capture(faction):
	if is_captured == false: print("Territory captured by faction: ", faction)
	is_captured = true
	owner_faction = faction
	update_color()

#Godot input handling, boilerplate i guess
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton: #only when mouse button; to avoid trigger by just hover
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			capture(1)
