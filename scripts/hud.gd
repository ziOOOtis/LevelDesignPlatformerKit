extends CanvasLayer
@onready var level_complete: Label = %"Level Complete"

func _ready() -> void:
	level_complete.visible = false

func _on_coin_collected(coins):
	get_tree().call_group("Door", "coin_amount_updated",coins)
	$Coins.text = str(coins)

func _on_player_reached_goal() -> void:
	level_complete.visible = true
	get_tree().paused = true
