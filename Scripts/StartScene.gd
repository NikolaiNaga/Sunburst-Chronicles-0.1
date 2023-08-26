extends Node2D

@onready var PlayerNameTextEdit: TextEdit = $PlayerNameTextEdit

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")
	Global.showWelcomeText()

func _on_player_name_text_edit_text_changed():
	Global.PlayerName = PlayerNameTextEdit.text

func _input(event):
	pass
