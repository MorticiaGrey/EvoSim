extends Node2D

export (int) var gridSize = 10

export (int) var maxOrganismHeight = 10
export (int) var maxOrganismWidth = 10

export (PackedScene) var startingOrganism

var organisms := []

var registeredInputCells = []

var numberOfOrganisms := 0

var totalWidth: int
var totalHeight: int

var midX: int
var midY: int

# if it turns out I don't need the grid stuff remember to delete it

func _ready():
	updateGridVars()
	addOrganism(startingOrganism)
	
#	Only way to do this without conditionals
	for i in range(totalHeight):
		registeredInputCells.append([])
		for j in range(totalWidth):
			registeredInputCells[i].append([])


func gridToRealCoord(coord: int) -> int:
	return coord * gridSize


func setPosition(object) -> void:
	#	Centers organisms before placing them
	object.x = midX + object.x
	object.y = midY + object.y
	
	object.x = clamp(object.x, 0, object.x)
	object.y = clamp(object.y, 0, object.y)
	
	object.position.x = gridToRealCoord(object.x)
	object.position.y = gridToRealCoord(object.y)


func spaceOccupied(x: int, y: int) -> bool:
	return false


func addOrganism(newOrganism: PackedScene) -> void:
	var organism = newOrganism.instance()
	organism.init(self)
	
	setPosition(organism)
	
	organisms.append(organism)
	$CanvasLayer.add_child(organism)


func updateGridVars() -> void:
	totalWidth = round(get_viewport_rect().size.x / gridSize)
	totalHeight = round(get_viewport_rect().size.y / gridSize)
	midX = round(totalWidth / 2)
	midY = round(totalHeight / 2)


func registerInputCell(cell, x: int, y: int):
	registeredInputCells[y][x].append(cell)


func getInputCellsAtGridLoc(x: int, y: int) -> Array:
	return registeredInputCells[y][x]
