extends Node2D

@onready var key: Node2D = $key
@onready var tile: TileMapLayer = $TileMapLayer
var state : int
@onready var label: Label = $Label
@onready var door: Node2D = $door
@onready var col: CollisionShape2D = $door/StaticBody2D/CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = 0
	global.level = 2
	door.global_position = Vector2i(-136, 103)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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
	
	
	if Input.is_action_just_pressed("rotate_cw"):
		state += 1
		label.hide()
	if Input.is_action_just_pressed("rotate_ccw"):
		state -= 1
		label.hide()
	


func _on_out_of_bounds_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		body.global_position = Vector2i(0, 0)
	if body.has_method("block"):
		get_tree().reload_current_scene()


func _on_key_solved() -> void:
	get_tree().change_scene_to_file("res://scene/wip.tscn")



func _on_button_is_pressed() -> void:
	door.hide()
	door.global_position = Vector2i(-42, 132)

func _on_button_is_not_pressed() -> void:
	door.show()
	door.global_position = Vector2i(-136, 103)
	
