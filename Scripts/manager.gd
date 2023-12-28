extends Node

var pause = false

func restart():
	get_tree().reload_current_scene()
	ScoreManager.current_score = 0
	pause = false
