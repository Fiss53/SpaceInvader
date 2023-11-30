extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
var speed = 500
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	velocity.x = 0
	velocity.y = 0
	
func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed
#func _input(ev):
	#if Input.is_key_pressed(KEY_ESCAPE):
		#get_tree().paused = true
		#get_tree().change_scene_to_file("res://scene/menu.tscn")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	move_and_slide()
	
	
	
	
		

