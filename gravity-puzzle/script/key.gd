extends Node2D

var collected : bool
var level = global.level

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
		collected = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("rotate_cw"):
		cw()
	if Input.is_action_just_pressed("rotate_ccw"):
		ccw()
	
	if collected and level == 0:
		get_tree().change_scene_to_file("res://scene/level_2.tscn")
