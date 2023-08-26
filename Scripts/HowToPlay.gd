extends Node2D

@onready var HowToJob: RichTextLabel = $HowToJob
@onready var HowToLevel: RichTextLabel = $HowToLevel
@onready var HowToBoss: RichTextLabel = $HowToBoss

func _ready():
	HowToJobFunction()
	HowToBossFunction()
	HideTexts()

func HowToJobFunction():
	HowToJob.text = "[center] Let's start by completing some jobs!\n\n Jobs are done by spending [color=#2474aa]mana[/color]\n\n Simply click on the [color=#2474aa]mana icon[/color] at the very top which leads you to job zone\n\n"
	HowToJob.text += "[center] Return once you completed 10 jobs\n\n"
	HowToJob.text += "[center] Jobs Completed " + str(Global.mana_jobs_done) + "/10"

func HowToLevelFunction():
	HowToLevel.text = "[center] Every level you recieve 3 skill points\n\n"
	HowToLevel.text += "[center] Those can be placed in various stats\n\n"
	HowToLevel.text += "[center] You can place your stats in 'profile', or by clicking on the green arrow top left\n\n"
	HowToLevel.text += "[center] Mana and Fortitude gets refilled on level up\n\n"

func HowToBossFunction():
	HowToBoss.text = "[center] [color=873600]Fortitude[/color] can be used on the boss\n\n"
	HowToBoss.text += "[center] Click on the Fortitude Icon, or on Boss in the bottom\n\n"
	HowToBoss.text += "[center] Return once you reach the level 3 boss\n\n"
	HowToBoss.text += "[center] Damage on boss increases the more Bulwark and Strength you have\n\n"
	HowToBoss.text += "[center] Boss Level: " + str(Global.current_boss_level) + "/3"

func HideTexts():
	if Global.mana_jobs_done >= 10:
		$HowToJob.visible = false
		$HowToBoss.visible = true
		if Global.current_boss_level >= 3:
			$HowToBoss.visible = false

func _on_button_pressed():
	$HowToLevel.visible = false
	$HowToLevel/Button.visible = false
