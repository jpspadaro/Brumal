extends Node

export var Player_HP = 100 # Humanity Points, not Hit Points
export var Player_Wealth = 0 # Wealth points (Kinda like a score)

var notifications = "WASD to move.\nUse mouse to look around.\nQ quits."
var current_world = "res://Main.tscn"


func _ready():
	pass # Replace with function body.

func notify(notification_text):
	notifications = String(notification_text) + "\n" + notifications
