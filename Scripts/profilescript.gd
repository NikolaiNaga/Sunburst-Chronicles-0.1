extends Node2D

@onready var PlayerNameLabel: Label = $PlayerNameLabel
@onready var AddStrength: Button = $AddStrength
@onready var AddBulwark: Button = $AddBulwark
@onready var AddMana: Button = $AddMana
@onready var AddFortitude: Button = $AddFortitude
@onready var ProfileLabel: RichTextLabel = $ProfileLabel

func _ready():
	PlayerNameLabel.text = Global.PlayerName
	update_labels()

func update_labels():
	var text = "[b]STATS:[/b]\n\n"
	text += "[color=#00ff00] Level:[/color] " + str(Global.current_level) + "\n"
	text += "[color=#00ff00] Experience:[/color] " + str(Global.experience) + "/" + str(Global.experience_required) + "\n"
	text += "[color=#00ff00] Total Experience: [/color] " + str(Global.experience_total) + "\n\n"
	text += "[color=#2474aa] Mana:[/color] " + str(Global.MAX_RESSOURCE_MANA) + "\n"
	text += "[color=#873600] Fortitude:[/color] " + str(Global.MAX_RESSOURCE_FORTITUDE) + "\n\n"
	text += "[color=#16A085] Bulwark:[/color] " + str(Global.bulwark) + "\n"
	text += "[color=#ff0000] Strength:[/color] " + str(Global.strength) + "\n\n"
	text += "[color=#ff9900] Skill Points:[/color] " + str(Global.skill_points) + "\n\n"
	text += "[color=#FDFEFE] Damage to boss: " + str(Global.get_damage_output())
	$ProfileLabel.text = text

func _on_add_strength_pressed():
	if Global.skill_points > 0:
		Global.strength += 1
		Global.skill_points -= 1
		update_labels()

func _on_add_mana_pressed():
	if Global.skill_points > 0:
		Global.MAX_RESSOURCE_MANA += 1
		Global.skill_points -= 1
		update_labels()

func _on_add_bulwark_pressed():
	if Global.skill_points > 0:
		Global.bulwark += 1
		Global.skill_points -= 1
		update_labels()

func _on_add_fortitude_pressed():
	if Global.skill_points > 0:
		Global.MAX_RESSOURCE_FORTITUDE += 1
		Global.skill_points -= 1
		update_labels()
