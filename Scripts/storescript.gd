extends Node2D

var Mana20Shop_use_button1: TextureButton
var Exp50Shop_use_button1: TextureButton

@onready var timerexp: Timer = $timerexp
@onready var exppopup: Label = $exppopup
@onready var Mana20Shop_use_button: Button = $Mana20Shop
@onready var Exp50Shop_use_button: Button = $Exp50Shop

func _ready():
	Mana20Shop_use_button.pressed.connect(_on_mana_20_shop_pressed)
	Exp50Shop_use_button.pressed.connect(_on_exp_50_shop_pressed)
	timerexp.timeout.connect(_on_exppopup_timeout)
	
	exppopup.text = "+50 EXP!"
	
func _on_exppopup_timeout():
	exppopup.visible = false

func _on_mana_20_shop_pressed():
	if Global.gold >= 100:
		Global.MANA_MAX_RESOURCE_VALUE += 20
		Global.gold -= 100

func _on_exp_50_shop_pressed():
	if Global.gold >= 65:
		Global.gain_experience(50)
		Global.gold -= 65
		exppopup.visible = true
		timerexp.start()

func _on_level_boss_damage_pressed():
	if Global.gold >= 100:
		Global.gold -= 100
		Global.level_damage_contribution += 0.1
