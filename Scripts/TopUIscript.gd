extends Node2D

var time_since_last_update: float = 0.0 #  Time since last update

func _ready():
	$ManaLabel.text = str(Global.mana) + "/" + str(Global.MAX_RESSOURCE_MANA)
	$FortitudeLabel.text = str(Global.fortitude) + "/" + str(Global.MAX_RESSOURCE_FORTITUDE)
	$TotalGoldLabel.text = str(Global.gold)
	$CurrentLevelLabel.text = str(Global.current_level)
	$ExperienceTracker.text = str(Global.experience) + "/" + str(Global.experience_required) + " XP"

func update_labels():
	$ManaLabel.text = str(Global.mana) + "/" + str(Global.MAX_RESSOURCE_MANA)
	$FortitudeLabel.text = str(Global.fortitude) + "/" + str(Global.MAX_RESSOURCE_FORTITUDE)
	$TotalGoldLabel.text = str(Global.gold)
	$CurrentLevelLabel.text = str(Global.current_level)
	$ExperienceTracker.text = str(Global.experience) + "/" + str(Global.experience_required) + " XP"

func _process(_delta):
	update_labels()
	Global.skill_points_available()

func _on_mana_icon_pressed():
	get_tree().change_scene_to_file("res://scenes/jobs.tscn")

func _on_fortitude_icon_pressed():
	get_tree().change_scene_to_file("res://scenes/boss.tscn")
