extends OptionButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#Load race list
	var file = File.new()
	file.open("res://Races.json", file.READ)
	var race_str  = file.get_as_text()
	file.close()
	var race_list = Dictionary()
	
	#Check if the race file is correctly parsed
	if race_list.parse_json(race_str):
		print("error: malformed race file")
		return
		
		
	var race_dicts = race_list.values()
	var i    = 0
	var size = race_dicts[0].size()
	
	while i < size:
		print(race_dicts[0][i]["name"])
		print("+++")

		
	#for arr_entry in race_dicts:
	#	print(arr_entry)

		#print(value)
		#print(race_list)
		#var name = entry[name]
		var race_name = race_dicts[0][i]["name"]
		add_item(race_name, i)
		set_item_text(i, race_name)
		i = i + 1
		#set_item_text(i, name)
		#i = i + 1
