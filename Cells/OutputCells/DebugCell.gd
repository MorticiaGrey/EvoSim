extends "res://Cells/OutputCell.gd"


func _triggered(strength: float) -> void:
	$Display.color = $Display.color.inverted()
