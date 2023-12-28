extends Area2D

var wait_time
var default_scale
var lose_screen = "res://Scenes/lose.tscn"

func _ready():
	default_scale = scale
	wait_time = rand_range(3, 6)
	var random_rotation = rand_range(-180, 180)
	$Tween.interpolate_property(self, "rotation_degrees", self.rotation_degrees, random_rotation, 4, 4, 2)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	var random_rotation = rand_range(-180, 180)
	$Tween.interpolate_property(self, "rotation_degrees", self.rotation_degrees, random_rotation, 4, 4, 2, wait_time)
	$Tween.start()
	yield(get_tree().create_timer(randi()%3), "timeout")
	pass # Replace with function body.

func _physics_process(delta):
	var overlapping_bodies =  get_overlapping_bodies()
	for i in overlapping_bodies:
		if i.is_in_group("ball"):
			if SoundManager.is_vibrate:
				Input.vibrate_handheld(500)
			get_tree().change_scene(lose_screen)
			
