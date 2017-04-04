extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var race_dict = Dictionary()
var class_dict = Dictionary()

func _ready():
	var race_file = File.new()
	#var class_file = File.new()
	race_file.open("Races.json", File.READ)
	if race_dict.parse_json(race_file.get_as_text()):
		print("error: malformed race file")
		return
	race_file.close()
	# Called every time the node is added to the scene.
	# Initialization here

func clear_hearts_below(s_hearts):
	var r_heart = load("res://assets/r_heart.png")
	var heart_arr = get_node("hearts").get_children()
	var i = 4 - s_hearts
	print(i)
	for num in range(i, 0, -1):
		print(heart_arr[num].get_name())
		heart_arr[num].set_texture(r_heart)
	


func _on_race_select_item_selected( ID ):
	var race_vals = race_dict.values()
	var race_size = race_vals.size()
	var cur_race  = race_vals[0][ID]
	if (cur_race.has("fight_dice") and cur_race.has("ranged_dice")
		and cur_race.has("defence_dice") and cur_race.has("armour")
		and cur_race.has("movement") and cur_race.has("initiative")):
		get_node("stat_disp/attack_disp").set_text(str(cur_race["fight_dice"]))
		get_node("stat_disp/ranged_disp").set_text(str(cur_race["ranged_dice"]))
		get_node("stat_disp/defence_disp").set_text(str(cur_race["defence_dice"]))
		get_node("stat_disp/armour_disp").set_text(str(cur_race["armour"]))
		get_node("stat_disp/movement_disp").set_text(str(cur_race["movement"]))
		get_node("stat_disp/init_disp").set_text(str(cur_race["initiative"]))
		get_node("stat_labels/s_hearts").set_text(str(cur_race["silver_heart"]))
		get_node("stat_disp/mana/start_mana/start_mana_disp").set_text(str(cur_race["start_mana"]))
		get_node("stat_disp/mana/max_mana/max_mana_disp").set_text(str(cur_race["max_mana"]))
	else:
		print("error: missing race data!")
	if(cur_race.has("silver_heart")):
		var s_heart = load("res://assets/s_heart.png")
		var silver_val = cur_race["silver_heart"]
		clear_hearts_below(silver_val)
		if   silver_val >= 1:
			get_node("hearts/heart1").set_texture(s_heart)
		if silver_val >= 2:
			get_node("hearts/heart2").set_texture(s_heart)
		if silver_val >= 3:
			get_node("hearts/heart3").set_texture(s_heart)
		if silver_val >= 4:
			get_node("hearts/heart4").set_texture(s_heart)
		if silver_val == 5:
			get_node("hearts/heart5").set_texture(s_heart)
	else:
		print("error: missing race data!")
	#print(race_dict)
	#pass # replace with function body
