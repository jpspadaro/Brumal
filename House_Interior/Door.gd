extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		GameData.notify("Leaving cabin.")
		get_tree().change_scene(GameData.current_world)
