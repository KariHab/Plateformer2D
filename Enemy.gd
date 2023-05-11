extends Area2D

@export var move_speed : float = 30.0
@export var move_dir : Vector2

var start_position : Vector2
var target_position : Vector2

func _ready():
	start_position = global_position
	target_position = start_position + move_dir
	
func _process(delta):
	global_position = global_position.move_toward(target_position, move_speed * delta)
	
	if global_position == target_position:
		if global_position == start_position:
			target_position = start_position + move_dir
		else:
			target_position = start_position


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.game_over()
