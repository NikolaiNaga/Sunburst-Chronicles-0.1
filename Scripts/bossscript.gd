extends Node

@onready var BossDetails: RichTextLabel = $BossDetails
@onready var AttackDetails: RichTextLabel = $AttackDetails

func _ready():
	Boss_Update()
	Attack_Update()

func Boss_Update():
	var text = "[b]BOSS: [/b]\n"
	text += "[color=#C0392B]Boss Level: " + str(Global.current_boss_level) + "\n"
	text += "[color=#C0392B]Health: " + str(Global.damage_to_boss) + "/" + str(Global.damage_to_boss_required) + "[/color]\n"
	text += "[color=FFFFFF]Damage Per Hit: " + str(Global.get_damage_output())
	$BossDetails.bbcode_text = text

func _on_boss_pressed():
	if Global.fortitude >= 5:
		Global.deal_damage(Global.get_damage_output())
		Global.fortitude -= 5
		Global.gain_experience(3)
		Boss_Update()

func Attack_Update():
	AttackDetails.text = "[right] Click to Attack\n"
	AttackDetails.text += "[right] Costs 5 Fortitude"
