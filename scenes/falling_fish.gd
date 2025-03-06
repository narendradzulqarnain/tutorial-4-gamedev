extends RigidBody2D

@export var scene_name = "LoseScreen"


func _ready():
	contact_monitor = true
	max_contacts_reported = 2


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/" + scene_name + ".tscn"))
	else:
		queue_free()
