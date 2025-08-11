extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

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
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("rotate_cw"):
		cw()
	if Input.is_action_just_pressed("rotate_ccw"):
		ccw()
	
	move_and_slide()

func player():
	pass
