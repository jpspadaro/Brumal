extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var narrative_text = ""
export var narrative_title = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_NarrativeArea_body_entered(body):
	if body.is_in_group("Player"):
		if not narrative_title in GameData.narratives_triggered:
			GameData.notify(narrative_text)
			GameData.narratives_triggered.append(narrative_title)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
