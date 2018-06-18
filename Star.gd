extends KinematicBody2D

const SPEED = 1000
var motion = Vector2()


# Thank you GDquest!
func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)
	
func _physics_process(delta):
	get_parent().set_offset(get_parent().get_offset() + SPEED *delta)
	
	if self.collides()
	
	var direction = Vector2()
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-4, 0)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(4, 0)
	
	motion = direction.normalized() * SPEED
	motion = cartesian_to_isometric(motion)

	move_and_slide(motion)
