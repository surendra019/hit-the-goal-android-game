extends Control
onready var score_container = $score_container
onready var best_score = $score_container/best_score
onready var current_score = $score_container/score

onready var head =  $Head
onready var bg = $bg

onready var button_container = $Buttons
var menu = "res://Scenes/Menu.tscn"
var in_game = "res://Scenes/in_game.tscn"

onready var line1 = $line1
onready var line2 = $line2

func _ready():
	SoundManager.stop_bg_music()
	best_score.text += str(ScoreManager.best_score)
	
	current_score.text += str(ScoreManager.current_score)
	

func _on_restart_btn_pressed():
	
	get_tree().change_scene(in_game)
	ScoreManager.current_score = 0
	pass # Replace with function body.


func _on_menu_btn_pressed():
	get_tree().change_scene(menu)
	pass # Replace with function body.


func _on_restart_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.


func _on_menu_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.
