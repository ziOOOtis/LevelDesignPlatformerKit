extends Node3D
var touched : bool
@export var speedrun_mode : bool
var hud : CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var flags_amount : int = get_tree().get_nodes_in_group("Flag").size()
	if flags_amount > 1 and speedrun_mode:
		printerr("You can't have more than one flag if it's a speedrun level")
		get_tree().quit()
	
	if speedrun_mode:
		hud = get_tree().get_nodes_in_group("HUD")[0]
		hud.start_speedrun()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.has_method("touched_goal") and !touched:
		touched = true
		body.touched_goal()
