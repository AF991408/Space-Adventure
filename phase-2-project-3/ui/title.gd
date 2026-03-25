extends Control

func _ready():
	$AudioStreamPlayer2D.play()
func hide_hud():
	if Input.is_action_just_pressed( "jump"):
		$TextureRect.hide()
		$TextureRect2.hide()
		$Title.hide()
		$Message.hide()
		
func _input(event):
	if event.is_action_pressed("esc"):
		
		get_tree().change_scene_to_file("res://levels/level_01.tscn")
		
