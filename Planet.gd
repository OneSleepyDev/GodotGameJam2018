extends Node2D

# class member variables go here, for example:
var isBad = false;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _init():
	isBad = bool(round(rand_range(0,1)));
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
