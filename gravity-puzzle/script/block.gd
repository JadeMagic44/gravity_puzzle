extends RigidBody2D

var state
var pattern

func _ready() -> void:
	state = 0
	pattern = 0

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

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("rotate_cw"):
		cw()
	if Input.is_action_just_pressed("rotate_ccw"):
		ccw()

func block():
	pass
func heavy():
	pass
