extends KinematicBody2D

const SPEED = 180


func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
	
	motion = motion.normalized() * SPEED

	move_and_slide(motion)
