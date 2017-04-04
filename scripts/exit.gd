
func _ready():
	set_process(true)

#Exit
func _on_Exit_pressed():
	get_tree().quit()
	#pass # replace with function body

func _on_New_Game_pressed():
	#var scene = load("res://Main_Game.tscn")
	get_tree().change_scene("res://Main_Game.tscn")
			#pass # replace with function body


func _on_Options_pressed():
	get_tree().change_scene("res://Particles.tscn")
	pass # replace with function body

func _process():
	print("Hello")
	if(Input.is_action_pressed("exit")):
		print("Exit")
		get_tree().quit()
		
		
		