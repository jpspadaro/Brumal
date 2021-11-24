extends Node

export var Player_HP = 100 # Humanity Points, not Hit Points
export var Player_Wealth = 0 # Wealth points (Kinda like a score)

var notifications = "WASD to move.\nUse mouse to look around.\nQ quits.\nVersion: 0.1 alpha"
var current_world = "res://Main.tscn"


func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("test_input"):
		notify("Test Notification.")
		get_inventory()
		Player_HP -= 1
	if event.is_action_pressed("quit"):
		get_tree().quit()
	

func notify(notification_text):
	notifications = String(notification_text) + "\n" + notifications

func pick_up(node):
	if node.is_in_group("Items"):
		$Inventory.add_child(node)
	else:
		notify("Not an item you can pick up!")

func get_inventory():
	var inv_list = []
	for i in range($Inventory.get_child_count()):
		inv_list.append($Inventory.get_child(i).name)
	print ("Inventory: " + String(inv_list))
	return inv_list
