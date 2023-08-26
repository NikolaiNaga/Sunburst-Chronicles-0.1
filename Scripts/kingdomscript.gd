extends Node2D

@onready var KingdomBuildingCount: RichTextLabel = $KingdomBuildingCount
@onready var BuildingOptions: PopupMenu = $"../Control/BuildingOptions"
@onready var Addbuilding: Button = $AddBuilding
@onready var GoldMinePanel: Panel = $"../GoldMinePanel"
@onready var GMdetails: RichTextLabel = $"../GoldMinePanel/GMdetails"

func _ready():
	update_labels()
	
func update_labels():
	KingdomBuildingCount.text = "[center][b]" + Global.PlayerName + "'s Kingdom!"
	if Global.gold_mine_level == 0:
		GMdetails.text = " Unlock Cost: " + str(Global.gold_mine_cost) + " Gold\n\n"
		GMdetails.text += " Generates 1 gold every 10 sec"
	if Global.gold_mine_level >= 1:
		GMdetails.text = " Level: " + str(Global.gold_mine_level) + "\n\n"
		$GoldMine.visible = true
		GMdetails.text += " Mining: " + str(Global.gold_mine_regen) + " gold every 10 seconds\n"
		GMdetails.text += " Gold Mined: " + str(Global.gold_mine_regen_total) + "\n\n"
		GMdetails.text += " Level: " + str(Global.gold_mine_level) + "/10\n"
		GMdetails.text += " Next Level Cost: " + str(Global.gold_mine_cost) + " gold"


func _on_add_building_pressed():
	var AddBuilding_position = Addbuilding.get_global_position()
	BuildingOptions.position = AddBuilding_position
	$"../Control/BuildingOptions".popup()
	update_labels()

func _on_building_options_index_pressed(index):
	if index == 0:
		GoldMinePanel.visible = true

func _on_g_mclose_pressed():
	GoldMinePanel.visible = false

func _on_gold_mine_pressed():
	GoldMinePanel.visible = true

func _process(delta):
	update_labels()
