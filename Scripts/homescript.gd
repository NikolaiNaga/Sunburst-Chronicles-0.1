extends Node2D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	Global.WelcomeText.visible = false
	
