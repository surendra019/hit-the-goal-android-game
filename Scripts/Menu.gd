extends Control


onready var bg = $bg
onready var line1 = $line1
onready var line2 = $line2
onready var head = $Head
onready var best_score = $best_score
onready var buttons_container = $Buttons

var in_game=  "res://Scenes/in_game.tscn"
var settings = "res://Scenes/Settings.tscn"

func _exit_tree():
	SoundManager.save()
	pass
	
	
func _ready():
	ScoreManager.save()
	SoundManager.stop_bg_music()
	best_score.text+=str(ScoreManager.save_script.best_score)
	


func _on_play_btn_pressed():
	Manager.pause = false
	ScoreManager.current_score = 0
	get_tree().change_scene(in_game)
	pass # Replace with function body.


func _on_settings_btn_pressed():
	get_tree().change_scene(settings)
	pass # Replace with function body.


func _on_exit_btn_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_play_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.


func _on_exit_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.
	


func _on_settings_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.
