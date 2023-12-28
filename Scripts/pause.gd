extends Node2D

onready var button_container = $Buttons
onready var head = $Head

onready var bg = $bg
var menu = "res://Scenes/Menu.tscn"

onready var line1 = $line1
onready var line2 = $line2

func _ready():
	pass


func _on_menu_btn_pressed():
	
#	ScoreManager.save()
	get_tree().change_scene(menu)
	pass # Replace with function body.


func _on_restart_btn_pressed():
	Manager.restart()
	pass # Replace with function body.

func _notification(what):
	if what==NOTIFICATION_WM_GO_BACK_REQUEST:
		Manager.pause = false
		self.visible = false


func _on_return_btn_button_up():
	self.visible = false
	yield(get_tree().create_timer(.7), "timeout")
	Manager.pause = false
	
	pass # Replace with function body.


func _on_restart_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.


func _on_return_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.


func _on_menu_btn_button_down():
	SoundManager.play_btn_sound()
	pass # Replace with function body.
