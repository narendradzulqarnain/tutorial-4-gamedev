extends RigidBody2D

@export var sceneName = "LoseScreen2"
var explosion = load("res://assets/kenney_platformerpack/PNG/Particles/fireball.png")

func _ready():
	contact_monitor = true
	max_contacts_reported = 1

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/"+ sceneName +".tscn"))
	else:
		$Sprite2D.texture = explosion
		await get_tree().create_timer(0.1).timeout
		queue_free()
		
