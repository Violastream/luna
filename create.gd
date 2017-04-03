extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "text var"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass



func _on_save_pressed():
	var save_char = File.new()
	var save_name  = get_node("char_name/name_field").get_text()
	
	#Make dict string
	var char_data = Dictionary()
	char_data["char_name"] = get_node("char_name/name_field").get_text()
	char_data["char_race"] = get_node("stat_edit/race_select").get_text()
	char_data["char_atta"] = get_node("stat_edit/stat_disp/attack_disp").get_text()
	char_data["char_rang"] = get_node("stat_edit/stat_disp/ranged_disp").get_text()
	char_data["char_defe"] = get_node("stat_edit/stat_disp/defence_disp").get_text()
	char_data["char_armo"] = get_node("stat_edit/stat_disp/armour_disp").get_text()
	char_data["char_move"] = get_node("stat_edit/stat_disp/movement_disp").get_text()
	char_data["char_init"] = get_node("stat_edit/stat_disp/init_disp").get_text()
	char_data["char_biog"] = get_node("bio").get_text()
	
	if save_name.empty():
		print("Expected name")
		return
	save_char.open( str("res://saves/",save_name,".lsv"), File.WRITE )
	
	save_char.store_string(char_data.to_json())
	save_char.close()
	pass # replace with function body


func _on_load_pressed():
	var save_name  = get_node("char_name/name_field").get_text()
	
	pass # replace with function body
