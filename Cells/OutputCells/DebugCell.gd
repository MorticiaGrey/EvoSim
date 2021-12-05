extends "res://Cells/OutputCell.gd"


func triggered(strength: float) -> void:
	$Display.color = $Display.color.inverted()
