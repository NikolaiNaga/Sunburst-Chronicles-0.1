extends Control

func _on_g_mbuy_pressed():
	if Global.gold_mine_level == 0:
		if Global.gold >= Global.gold_mine_cost:
			$"../KingdomStart/GoldMine".visible = true
			Global.gold -= 10
			Global.gold_mine_regen += 1
			Global.gold_mine_cost += 4500
			Global.gold_mine_level += 1
			$"../KingdomStart".update_labels()

