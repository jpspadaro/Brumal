extends Node

export var Player_HP = 100 # Humanity Points, not Hit Points
export var Player_Wealth = 0 # Wealth points (Kinda like a score)

var notifications = "WASD to move.\nUse mouse to look around.\nQ quits.\nVersion: 0.1 alpha"
var current_world = "res://Main.tscn"

export var inv_list = []

func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("test_input"):
		notify("Test Notification.")
		Player_HP -= 1
	if event.is_action_pressed("inventory"):
		notify(get_inventory())
	if event.is_action_pressed("quit"):
		get_tree().quit()
	

func notify(notification_text):
	notifications = String(notification_text) + "\n" + notifications

func pick_up(node):
	if node.is_in_group("Items"):
		inv_list.append(node.inv_id)
		notify(node.inv_id + " has been picked up.")
		node.queue_free()
	else:
		notify("Not an item you can pick up!")
	

func get_inventory():
	print ("Inventory: " + String(inv_list))
	return inv_list
