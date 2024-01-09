extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var type_ = "enemy"

var vitesse = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += vitesse * delta 



func _on_enemy_hit_box_body_entered(body):
	if body.name == "Player" && HpScript.lives > 0:
		HpScript.lives -= 1
	elif body.name == "Player" && HpScript.lives == 0:
		get_tree().reload_current_scene()


