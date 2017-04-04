extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _draw():
	var location = get_global_mouse_pos()
	var color = Color(154,219,248)
	draw_circle(location,1,color)