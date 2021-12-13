extends Control


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	print ("Emacs Test.")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Main.tscn")
