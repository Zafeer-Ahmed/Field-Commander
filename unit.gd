extends CharacterBody2D

@export var speed: float = 200.0
@export var unit_type: String = "light"

var target_position: Vector2 = position
var is_selected: bool = false

func ready():
	add_to_group("units")

func _physics_process(delta):
	if position.distance_to(target_position) >5:
		var direction = (target_position - position).normalized()
		velocity = direction*speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		
func set_target(new_target: Vector2):
	target_position = new_target

func select():
	is_selected = true
	modulate = Color(1.2, 1.2, 1.2)
	
func deselect():
	is_selected = false
	modulate = Color(1, 1, 1)
