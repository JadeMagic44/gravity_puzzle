extends RigidBody2D

var state
var pattern

func _ready() -> void:
	state = 0
	pattern = 0

func _90():
	var x = global_position.x
	var y = global_position.y
	global_position.x = -y
	global_position.y = x



	
	#if state == 1 and pattern == 0:
	#	_90()
	#	pattern = 1

func block():
	pass
