extends Node

var win_size = OS.get_window_size()

func set_value(value):
	value = (value/float(634))*win_size.y
	return value
	pass
