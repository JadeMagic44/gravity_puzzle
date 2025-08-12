extends Node2D

@export var state : int 
@onready var door: Node2D = $"."
func cw():
	var x = global_position.x
	var y = global_position.y
	global_position.x = -y
	global_position.y = x

func ccw():
	var x = global_position.x
	var y = global_position.y
	global_position.x = y
	global_position.y = -x

func _physics_process(_delta: float) -> void:
	match state:
		-1:
			state = 3
		0:
			door.global_rotation = 2*PI
		1:
			door.global_rotation = PI/2
		2:
			door.global_rotation = PI
		3:
			door.global_rotation = 3*PI/2
		4:
			state = 0 
	
	if Input.is_action_just_pressed("rotate_cw"):
		cw()
		state += 1
	
	if Input.is_action_just_pressed("rotate_ccw"):
		ccw()
		state -= 1
