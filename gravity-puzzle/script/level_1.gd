extends Node2D

@onready var tile = $TileMapLayer
@export var state : int
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = 0
	global.level = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
		-1:
			state = 3
		0:
			tile.global_rotation = 2*PI
		1:
			tile.global_rotation = PI/2
		2:
			tile.global_rotation = PI
		3:
			tile.global_rotation = 3*PI/2
		4:
			state = 0
	
	if Input.is_action_just_pressed("rotate_ccw"):
		state -= 1
		label.hide()
	if Input.is_action_just_pressed("rotate_cw"):
		state += 1
		label.hide()


func _on_reset_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		body.global_position = Vector2i(0, 0)
 


func _on_key_solved() -> void:
	get_tree().change_scene_to_file("res://scene/level_2.tscn")
