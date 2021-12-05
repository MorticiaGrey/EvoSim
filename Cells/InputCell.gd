extends "res://Cells/Cell.gd"

signal trigger(strength)
signal register(coordinates) # Coordinates = array of vector 2d

export (int) var detectionRadius = 10

# I have this to tell me what to connect the signal to
var outputCells: PoolStringArray = []


func setSize(width: int, height: int) -> void:
	$Display.rect_size.x = width
	$Display.rect_size.y = height
	$Display/Collider/CollisionShape.shape.extents = Vector2(width / 2, height / 2)
	$Display/DetectionCollider/CollisionShape.shape.radius = detectionRadius
	# Necessary because messing with shape size puts it in weird place for some reason
	$Display/Collider.position.x = 0
	$Display/Collider.position.y = 0
	$Display/DetectionCollider.position.x = 0
	$Display/DetectionCollider.position.y = 0


func _on_DetectionCollider_area_entered(area):
	emit_signal("trigger", 1.0)
