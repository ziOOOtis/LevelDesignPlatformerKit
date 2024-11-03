@tool
extends Node3D
@export var death_height : float = -10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not Engine.is_editor_hint():
		global_position = Vector3(0,death_height,0)
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		global_position = Vector3(0,death_height,0)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.has_method("player_died"):
		body.player_died()
