extends Node2D

# Buttons to open Job Zones
func _on_job_zone_1_open_pressed():
	$"../JobZone1".visible = true
	$JobButtons.visible = false
	$Return.visible = true
# Buttons to open Jobs
func _on_mana_job_1_pressed():
	$Job1.visible = true

func _on_mana_job_2_pressed():
	$Job2.visible = true

# Buttons to close Jobs
func _on_close_1_pressed():
	$Job1.visible = false

func _on_close_2_pressed():
	$Job2.visible = false

# Buttons to do the Jobs
func _on_do_job_1_pressed():
	if Global.current_level >= 1:
		if Global.mana >= 3:
			Global.gain_experience(2)
			Global.gold += 1
			Global.mana -= 3
			Global.mana_jobs_done += 1

func _on_do_job_2_pressed():
	if Global.current_level >= 1:
		if Global.mana >= 5:
			Global.gain_experience(3)
			Global.gold += 2
			Global.mana -= 5
			Global.mana_jobs_done += 1

