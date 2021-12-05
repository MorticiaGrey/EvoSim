extends "res://Cells/InputCell.gd"


func _init():
	outputCells.append("DebugCell")


func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		emit_signal("trigger", 1.0)
