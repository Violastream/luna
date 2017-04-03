extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var i = 0


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	



func _process(delta):
	#var location = get_viewport().get_mouse_pos()
	var location = get_global_mouse_pos()
	
	if(Input.is_action_pressed("exit")):
		get_tree().quit()
	if(Input.is_action_pressed("start_particle")):
		add_child(find_node("Circle"),true)
		
		print("had event")
		#get_child(0).set_hidden(false)
	print(location)
	if(i > 1023):
		i = 0
	var particles = get_child(1)
	#particles.set_pos(location)
	#particles.set_amount(i)
	i = i + 1

	