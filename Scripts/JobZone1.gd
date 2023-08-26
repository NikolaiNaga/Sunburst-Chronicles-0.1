extends Node2D

var selected = false
var mouse_offset = Vector2(0, 0)
var scene_width: float
var image_width: float

func _ready():
	scene_width = get_viewport_rect().size.x
	image_width = $Sprite2D.get_texture().get_width()

func _process(delta):
	if selected:
		followMouse()

func followMouse():
	var new_position = get_global_mouse_position() + mouse_offset
	var max_left_position = scene_width - image_width
	var max_right_position = 0
	new_position.x = clamp(new_position.x, max_left_position, max_right_position)
	position.x = new_position.x

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mouse_offset = position - get_global_mouse_position()
			selected = true
		else:
			selected = false

func _on_return_pressed():
	$".".visible = false
	$"../Node2D/JobButtons".visible = true
	$"../Node2D/Job1".visible = false
	$"../Node2D/Job2".visible = false
	$"../Node2D/Return".visible = false

