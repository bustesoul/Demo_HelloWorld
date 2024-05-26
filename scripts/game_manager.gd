extends Node

@onready var label_game_score = $Label_game_score

var game_score = 0

func add_score():
	game_score += 1
	print(game_score)
	label_game_score.text = "You have been \ncollect " + str(game_score) + " coins !"
	
