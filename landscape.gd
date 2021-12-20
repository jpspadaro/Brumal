extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://LoseGame.tscn")
