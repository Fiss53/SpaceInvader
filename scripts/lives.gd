extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Hp.lives = 3


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
		f.store_csv_line(line)
	get_node("/root/State").classement = classement
	f.close()

class Sorter:
	func custom_sort(a, b):
		return a > b
var sorter = Sorter.new()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var state = get_node("/root/State")
	if(Hp.lives == 2):
		$Sprite1.hide()
	if(Hp.lives == 1):
		$Sprite2.hide()
	if(Hp.lives == 0):
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
