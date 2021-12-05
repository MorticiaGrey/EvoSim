extends Node2D

enum type {
	STANDARD,
	INPUT,
	OUTPUT
}

export (String) var cellName = "cell"
export (Color) var color = Color.white
export (int) var x = 0
export (int) var y = 0
export (type) var cellType = type.STANDARD


func _ready():
	$Display.color = color


func setSize(width: int, height: int) -> void:
	$Display.rect_size.x = width
	$Display.rect_size.y = height
	$Display/Collider/CollisionShape.shape.extents = Vector2(width / 2, height / 2)
	# Necessary because messing with shape size puts it in weird place for some reason
	$Display/Collider.position.x = 0
	$Display/Collider.position.y = 0
