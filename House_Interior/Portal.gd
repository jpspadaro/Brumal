extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Portal_Area_body_entered(body):
	if body.is_in_group("Player"):
		if GameData.inv_list[GameData.inv_held] == "Liber Avaritiae":
			GameData.current_world = "res://Main.tscn"
			GameData.notify("The world around you seems familiar.")
			$Portal_Area/AudioStreamPlayer.play(23.0)
		if GameData.inv_list[GameData.inv_held] == "Relic Of Tongratell":
			GameData.current_world = "res://WorldOfTongratell.tscn"
			GameData.notify("The world outside roars. You feel like you are in a different place.")
			$Portal_Area/AudioStreamPlayer.play(23.0)
		if GameData.inv_list[GameData.inv_held] == "Relic Of Grent":
			GameData.current_world = "res://WorldOfGrent.tscn"
			GameData.notify("The world outside screams, then is deathly silent. You feel like you are in a different place.")
			$Portal_Area/AudioStreamPlayer.play(23.0)
		if GameData.inv_list[GameData.inv_held] == "Relic Of Nul":
			GameData.current_world = "res://WorldOfNul.tscn"
			GameData.notify("The world outside storms, then goes quiet. You feel like you are in a different place.")
			$Portal_Area/AudioStreamPlayer.play(23.0)
		if GameData.inv_list[GameData.inv_held] == "Relic Of Dirk":
			GameData.current_world = "res://WorldOfDirk.tscn"
			GameData.notify("The world outside buzzes, then the sound fades. You feel like you are in a different place.")
			$Portal_Area/AudioStreamPlayer.play(23.0)
   		if GameData.inv_list[GameData.inv_held] == "Relic Of Id":
			GameData.current_world = "res://WorldOfId.tscn"
			GameData.notify("Unatural silence permeates everything. You feel like you are in a different place.")
			$Portal_Area/AudioStreamPlayer.play(23.0
