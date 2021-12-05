extends "res://Cells/Cell.gd"

signal trigger(strength)
signal register(coordinates) # Coordinates = array of vector 2d

var outputCells = []


func _init():
	cellType = type.INPUT


# Called something moves into the area this cell is registered to
func trigger(x: int, y: int):
	pass
