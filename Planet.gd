extends Node2D

# class member variables go here, for example:
var isBad = false
var amountOfImpact = 0

# constants
const MAXIMUM_IMPACT = 50

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _init():
	isBad = bool(round(rand_range(0,1)))
	amountOfImpact = round(rand_range(0,MAXIMUM_IMPACT))


func _collision ():
	if isBad:
		return amountOfImpact*-1
	else:
		return amountOfImpact

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
