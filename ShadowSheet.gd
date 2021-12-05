extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector3()
export var Speed = 4
var gravity = -9.8

var target = global_transform.origin

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_target(targetin):
	target = targetin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var desired_velocity = Vector3()
	
	desired_velocity = -target.normalized()
	# desired_velocity.y += gravity * delta
	print ("Shadow Target:" + String(target))
	desired_velocity = desired_velocity * Speed
		
	velocity = desired_velocity
	

	print ("Velocity: " + String(velocity))
	velocity = move_and_slide(velocity, Vector3.UP, true)


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		GameData.notify("It touches you! Pain siezes you!")
		GameData.Player_HP -= 25
