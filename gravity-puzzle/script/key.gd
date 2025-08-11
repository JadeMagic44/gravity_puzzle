extends Node2D

var collected : bool
var level = global.level
signal solved

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

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		emit_signal("solved")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("rotate_cw"):
		cw()
	if Input.is_action_just_pressed("rotate_ccw"):
		ccw()
	
