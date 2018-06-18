extends Node2D

var isBad = false
var amountOfImpact = 0
var red
var green
var blue

# constants
const MINIMUM_IMPACT = 0
const MAXIMUM_IMPACT = 50

func _ready():
	randomize()
	isBad = bool(round(rand_range(0,1)))
	amountOfImpact = round(rand_range(MINIMUM_IMPACT,MAXIMUM_IMPACT))
	if amountOfImpact >= 45 && isBad == false:
		get_node("Label").set_text(String(amountOfImpact)+"c")
		blue = 1
		red = .8
		green = .8
	if amountOfImpact < 45 && amountOfImpact >= 0  && isBad == false:
		get_node("Label").set_text(String(amountOfImpact)+"c")
		blue = .6
		red = 0
		green = 0
	if isBad:
		get_node("Label").set_text("-"+String(amountOfImpact)+"c")
		blue = 0
		red = .6
		green = 0

	get_node("giant").set_modulate(Color(red,green,blue))

func _on_Area2D_body_entered(body):
	if isBad:
		get_node("../../Path2D/PathFollow2D/Star")._add_temp(amountOfImpact*-1)
	else:
		get_node("../../Path2D/PathFollow2D/Star")._add_temp(amountOfImpact)
	