extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Hp.lives = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Hp.lives == 2):
		$Sprite2D.hide()
	if(Hp.lives == 1):
		$Sprite2.hide()	
	if(Hp.lives == 0):
		get_tree().reload_current_scene()
