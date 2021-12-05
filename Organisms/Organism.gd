class_name Organism
extends Node2D

export (int) var maxHealth = 10
export (int) var maxWidth = 10
export (int) var maxHeight = 10
export (PackedScene) var rootCell
export (float) var mutationRate = 0.05

var environment

var cells := []
var standardCells := []
var inputCells := []
var outputCells := []

var maxEnergy := 100
var energy := 99

var x := 0
var y := 0

var gridSize: int = 10


func _ready():
	addCell(rootCell)


# workaround because constructor wasn't working in environment
func init(env):
	environment = env


func addCell(newCell: PackedScene) -> void:
	var cell = newCell.instance()
	
#	Check if there's a cell there already
	for iCell in cells:
		if iCell.x == cell.x && iCell.y == cell.y:
			return
	
	cell.setSize(gridSize, gridSize)
	
	cell.position.x = cell.x * gridSize
	cell.position.y = cell.y * gridSize
	
	if cell.cellType == 0:
		standardCells.append(cell)
	elif cell.cellType == 1:
		inputCells.append(cell)
	elif cell.cellType == 2:
		outputCells.append(cell)
	
	cells.append(cell)
	add_child(cell)


func removeCell(x: int, y: int) -> void:
	for cell in cells:
		if cell.x == x && cell.y == y:
			cells.remove(cell)
			remove_child(cell)
