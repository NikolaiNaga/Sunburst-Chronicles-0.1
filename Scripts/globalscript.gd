extends CanvasLayer

@onready var GlobalLevelUpLabel: RichTextLabel = $GlobalLevelUpLabel
@onready var SkillPointsText: Label = $SkillPointsButton/SkillPointsText
@onready var SkillPointsButton: Button = $SkillPointsButton
@onready var WelcomeText: RichTextLabel = $WelcomeText

# Timer
var time_since_last_update: float = 0.0 #  Time since last update

# Player
var PlayerName: String

# Ressources
var MAX_RESSOURCE_MANA: int = 20
var MAX_RESSOURCE_FORTITUDE: int = 10
var mana: int = MAX_RESSOURCE_MANA
var fortitude: int = MAX_RESSOURCE_FORTITUDE

# Items / Values
var gold: int = 0

var gold_mine_regen: int = 0
var gold_mine_regen_total: int = 0
var gold_mine_level: int = 0
var gold_mine_cost: int = 1

# Power & Skill Points
var strength: int = 0
var bulwark: int = 0

var skill_points: int = 0

# Regeneration
var mana_regeneration: int = 1
var fortitude_regeneration: int = 1

# Level System Data
var current_level = 1
var experience = 0
var experience_total = 0
var experience_required = get_required_experience(current_level + 1)

# Achievement Tracker
var total_mana_used_coint: int = 0 # Counter for Mana
var total_fortitude_used_coint: int = 0
var mana_jobs_done: int = 0
var fortitude_jobs_done: int = 0

var level_damage_contribution: float = 0.0

func get_damage_output():
	return bulwark + strength + 1 + (current_level * level_damage_contribution)

# Kingdom Building System
var build_gm_timer: Timer = Timer.new()

# Boss Setup
var current_boss_level = 1
var damage_to_boss_required = get_health_required(current_boss_level +1)
var damage_to_boss = 12
var damage_to_boss_total = 0

# Boss System
func get_health_required(level):
	return round(pow(level, 1.7) + level + 7)

func deal_damage(amount):
	damage_to_boss_total += amount
	damage_to_boss -= amount
	if damage_to_boss <= 0:
		boss_level_up()

func boss_level_up():
	current_boss_level +=1
	damage_to_boss_required = get_health_required(current_boss_level + 1)
	damage_to_boss = damage_to_boss_required

# Experience / Level System
func get_required_experience(level):
	return round(pow(level, 1.2) + level + 4)

func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		level_up()
		showLevelUpLabel()

func level_up():
	current_level += 1
	experience_required = get_required_experience(current_level + 1)
	skill_points += 3
	mana = MAX_RESSOURCE_MANA
	fortitude = MAX_RESSOURCE_FORTITUDE
	skill_points_available()
	showLevelUpLabel()

func showLevelUpLabel():
	GlobalLevelUpLabel.text = "[center][b][color=#d78128] LEVEL UP! You are now level " + str(current_level) + "\n" + "[center][b]+3 Skill Points[/b][/center]"
	GlobalLevelUpLabel.visible = true
	await get_tree().create_timer(3).timeout
	GlobalLevelUpLabel.visible = false

func skill_points_available():
	if skill_points >= 1:
		SkillPointsText.text = str(skill_points)
		SkillPointsButton.visible = true
		SkillPointsText.visible = true
	else:
		SkillPointsButton.visible = false
		SkillPointsText.visible = false

func _on_skill_points_button_pressed():
	get_tree().change_scene_to_file("res://scenes/profile.tscn")

# Functions to Regenerate
func _on_fortitude_timer_timeout():
	Global.fortitude = clamp(Global.fortitude + Global.fortitude_regeneration, 0, Global.MAX_RESSOURCE_FORTITUDE)

func _on_mana_timer_timeout():
	Global.mana = clamp(Global.mana + Global.mana_regeneration, 0, Global.MAX_RESSOURCE_MANA)

func showWelcomeText():
	WelcomeText.text = "[center][color=#d78128] Welcome to the game [/color]\n" + str(PlayerName) + "\n\n" + "[color=#d78128]Click on 'How to play' button below for guide"
	WelcomeText.visible = true
	await get_tree().create_timer(20).timeout
	WelcomeText.visible = false

func _on_gold_mine_timer_timeout():
	Global.gold += gold_mine_regen
	gold_mine_regen_total += gold_mine_regen
	
