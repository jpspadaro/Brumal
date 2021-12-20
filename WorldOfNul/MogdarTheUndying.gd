extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var endgame = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Area_body_entered(body):
	if endgame:
		GameData.notify("\"Fool! I warned you! Even if you leave here you will never escape!\"")
	else:
		if body.is_in_group("Player"):
			GameData.notify("You receive a bauble.")
			GameData.notify("\"I am Mogdar. You are the first being I've seen in a very, very long time. I can see the greed in your soul. I give you this gift, although it will not save you from yourself.\"")
			GameData.notify("A floating being addresses you.")
			GameData.inv_list.append("Mogdar's Bauble")
			GameData.inv_list_all.append(51)
