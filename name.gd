extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_confirm_pressed():
	var disp = get_node("edit")
	
	get_node("display_name").set_text(disp.get_text())
	# pass # replace with function body
