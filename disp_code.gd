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
	else:
		print("error: missing race data!")
	#print(race_dict)
	#pass # replace with function body
