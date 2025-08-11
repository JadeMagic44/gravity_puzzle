extends Node2D



@onready var tile = $TileMapLayer
@export var state : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
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

func _on_player_interact() -> void:
	state += 1


func _on_reset_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		body.global_position = Vector2i(0, 0)
pass # Replace with function body.

func _on_solve_1_body_entered(body: Node2D) -> void:
	if body.has_method("player") and state == 2:
		get_tree().change_scene_to_file("res://level_2.tscn")


func _on_solve_2_body_entered(body: Node2D) -> void:
	if body.has_method("player") and state == 3:
		get_tree().change_scene_to_file("res://level_2.tscn")
