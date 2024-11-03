extends Node3D
var touched : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.has_method("touched_goal") and !touched:
		touched = true
		body.touched_goal()
