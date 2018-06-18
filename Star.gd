extends KinematicBody2D

const SPEED = 1200
var motion = Vector2()
var temp = 100


# Thank you GDquest!
func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)
	
func _add_temp(temperature):
	temp += temperature
	
func _physics_process(delta):
	# Lower the temperture as it goes on
	temp -= .01
	print(temp)
	
	# Send toward the sun on the path
	get_parent().set_offset(get_parent().get_offset() + SPEED *delta)
	
	# Left right movement
	var direction = Vector2()
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-4, 0)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(4, 0)
	
	#Converting to cartesian
	motion = direction.normalized() * SPEED
	motion = cartesian_to_isometric(motion)

	move_and_slide(motion)
