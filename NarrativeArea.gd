extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var narrative_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_NarrativeArea_body_entered(body):
	if body.is_in_group("Player"):
		GameData.notify(narrative_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
