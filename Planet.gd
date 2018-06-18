extends Node2D

# class member variables go here, for example:
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
		blue = 1
		red = .8
		green = .8
	if amountOfImpact < 45 && amountOfImpact >= 0  && isBad == false:
		blue = .6
		red = .6
		green = 0
	if isBad:
		blue = 0
		red = .6
		green = 0

	get_node("giant").set_modulate(Color(red,green,blue))
	
func _collision ():
	if isBad:
		return amountOfImpact*-1
	else:
		return amountOfImpact