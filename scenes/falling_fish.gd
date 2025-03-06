extends RigidBody2D

@export var sceneName = "LoseScreen"

func _ready():
	contact_monitor = true
	max_contacts_reported = 2

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/"+ sceneName +".tscn"))
	else:
		queue_free()
		


#func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	#if body.get_name() == "Player":
		#get_tree().change_scene_to_file(str("res://scenes/"+ sceneName +".tscn"))
	#else:
		#body.queue_free()
