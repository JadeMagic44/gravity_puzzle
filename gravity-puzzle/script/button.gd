extends Node2D

signal is_pressed
signal is_not_pressed
@export var state : int 
@onready var button: Node2D = $"."

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

func _ready():
	pass

func _process(delta: float) -> void:
	match state:
		-1:
			state = 3
		0:
			button.global_rotation = 2*PI
		1:
			button.global_rotation = PI/2
		2:
			button.global_rotation = PI
		3:
			button.global_rotation = 3*PI/2
		4:
			state = 0 
	
	if Input.is_action_just_pressed("rotate_cw"):
		cw()
		state += 1
	
	if Input.is_action_just_pressed("rotate_ccw"):
		ccw()
		state -= 1
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("heavy"):
		emit_signal("is_pressed")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("heavy"):
		emit_signal("is_not_pressed")
