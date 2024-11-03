extends CanvasLayer
@onready var level_complete: Label = %"Level Complete"
@onready var coins_label: Label = %CoinsLabel
@onready var play_again_button: Button = %PlayAgainButton
@onready var environment: WorldEnvironment = %Environment

var original_blur : bool
var original_blur_distance : float
var original_blur_amount : float

func _ready() -> void:
	level_complete.visible = false
	play_again_button.visible = false

func _on_coin_collected(coins):
	get_tree().call_group("Door", "coin_amount_updated",coins)
	coins_label.text = str(coins)

func _on_player_reached_goal() -> void:
	original_blur = environment.camera_attributes.get("dof_blur_far_enabled")
	original_blur_distance = environment.camera_attributes.get("dof_blur_far_distance")
	original_blur_amount = environment.camera_attributes.get("dof_blur_amount")
	
	environment.camera_attributes.set("dof_blur_far_enabled", true)
	environment.camera_attributes.set("dof_blur_far_distance", 0.0)
	environment.camera_attributes.set("dof_blur_amount", 0.1)
	level_complete.visible = true
	play_again_button.visible = true
	get_tree().paused = true


func _on_play_again_button_pressed() -> void:
	environment.camera_attributes.set("dof_blur_far_enabled", original_blur)
	environment.camera_attributes.set("dof_blur_far_distance", original_blur_distance)
	environment.camera_attributes.set("dof_blur_amount", original_blur_amount)

	get_tree().paused = false
	play_again_button.visible = false
	level_complete.visible = false
	coins_label.text = str(0)
	get_tree().reload_current_scene()
