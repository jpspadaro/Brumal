extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$SkinAnimation.play("Skin") # Replace with function body.
	#$FloatAnimation.play("Float")


func _on_SkinAnimation_animation_finished():
	$SkinAnimation.play("Skin")

#func _on_FloatAnimation_animation_finished():
#	$FloatAnimation.play("Float")

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		GameData.notify("You receive a bauble.")
		GameData.notify("\"I am Mogdar. You are the first being I've seen in a very, very long time. I can see the greed in your soul. I give you this gift, although it will not save you from yourself.\"")
		GameData.notify("A floating being addresses you.")
		GameData.inv_list.append("Mogdar's Bauble")
		GameData.inv_list_all.append(51)
