extends KinematicBody2D

var SPEED = 400
var motion = Vector2()
var temp = 60
var red
var green
var blue


# Thank you GDquest!
func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)
	
func _add_temp(temperature):
	temp += temperature
	
func _stats_change():
	if temp >= 100:
		blue = 1
		red = .9
		green = .9
		SPEED = 600
	if temp <100 && temp > 70:
		blue = .6
		red = .6
		green = .5
		SPEED = 200
	if temp < 70 && temp > 40:
		blue = 0
		red = .6
		green = 0
		SPEED = 150
	if temp <= 40:
		blue = 0
		red = .6
		green = 0
		SPEED = 100
	get_node("sprite").set_modulate(Color(red,green,blue))
	get_node("Particles2D").set_modulate(Color(red,green,blue))
	
func _physics_process(delta):
	get_node("Label").set_text(String(temp)+"c")
	# Lower the temperture as time goes on
	temp -= .07
	if temp <= 0:
		get_node("../../../AudioStreamPlayer").set_pitch_scale(.6)
		get_node("Camera2D").set_zoom(Vector2(4,4))
		get_node("Label3").visible = true
		get_node("Button").visible = true
	_stats_change()
	
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

func _on_Area2D_body_entered(body):
	get_node("Camera2D").set_zoom(Vector2(4,4))
	get_node("Label2").visible = true
	get_node("Button").visible = true


func _on_Button_pressed():
	get_tree().reload_current_scene()
