extends Control


onready var bg = $bg
onready var head = $Head
onready var button_container = $Buttons

var menu = "res://Scenes/Menu.tscn"

func _ready():
#	yield(SoundManager, "saves_loaded")
	set_btns()
	pass

func set_btns():
	$Buttons/sound_btn.pressed = !SoundManager.is_sound
	$Buttons/vibration_btn.pressed = !SoundManager.is_vibrate
	$Buttons/music_btn.pressed = !SoundManager.is_bg_music

		
func _on_close_btn_pressed():
	get_tree().change_scene(menu)
	pass # Replace with function body.

func _notification(what):
	if what==NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().change_scene(menu)


func _on_sound_btn_toggled(button_pressed):
	SoundManager.is_sound = !button_pressed
	pass # Replace with function body.


func _on_music_btn_toggled(button_pressed):
	SoundManager.is_bg_music = !button_pressed
	pass # Replace with function body.


func _on_vibration_btn_toggled(button_pressed):
	SoundManager.is_vibrate = !button_pressed
	pass # Replace with function body.


func _on_sound_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.


func _on_music_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.


func _on_vibration_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.


func _on_close_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.
