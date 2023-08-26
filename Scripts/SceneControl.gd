extends Node

func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")
	Global.WelcomeText.visible = false

func _on_shop_pressed():
	get_tree().change_scene_to_file("res://scenes/shop.tscn")
	Global.WelcomeText.visible = false

func _on_achievements_pressed():
	get_tree().change_scene_to_file("res://scenes/kingdom.tscn")
	Global.WelcomeText.visible = false

func _on_profile_pressed():
	get_tree().change_scene_to_file("res://scenes/profile.tscn")
	Global.WelcomeText.visible = false

func _on_boss_pressed():
	get_tree().change_scene_to_file("res://scenes/boss.tscn")
	Global.WelcomeText.visible = false
