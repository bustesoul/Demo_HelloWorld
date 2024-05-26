extends Area2D

@onready var game_manager = %GameManager
@onready var pick_up = $PickUp

func _on_body_entered(body):
	game_manager.add_score()
	pick_up.play("pickup")
