extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func open_file_classement():
	var index = 0
	var f = FileAccess.open("res://ressource/classement/classement.csv",FileAccess.READ)
	var classement = Array()
	while !f.eof_reached():
		var line = f.get_csv_line()
		classement.append(line)
	print(classement)
	f.close()
	return classement

func close_file_classement(classement):
	var f = FileAccess.open("res://ressource/classement/classement.csv",FileAccess.WRITE)
	for line in classement:
		if line[-1] == "":
			break
		f.store_csv_line(line)
	get_node("/root/State").classement = classement
	f.close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var state = get_node("/root/State")
	
	var spriteArr = get_children()
	if HpScript.lives != 3:
		spriteArr[HpScript.lives].hide()
		if HpScript.lives == 0:
			var classementDico = open_file_classement()
			print_debug(classementDico)
			var playerName = state.playerUsername
			var playerScore = state.enemy_count_score
			var scoreSupToClass = false
			var temp
			for pNameScore in classementDico:
				if pNameScore[-1] == "": 
					break
				if scoreSupToClass: #lower of one every other player
					print(temp)
					var _temp = temp
					temp = pNameScore
					pNameScore = _temp
				if int(pNameScore[-1]) < playerScore && !scoreSupToClass:
					temp = pNameScore 
					scoreSupToClass = true
					pNameScore[-1] = str(playerScore)
					pNameScore[0] = playerName
			print(classementDico)
			close_file_classement(classementDico)
			get_tree().change_scene_to_file("res://scene/Menu/end_game_menu.tscn")
