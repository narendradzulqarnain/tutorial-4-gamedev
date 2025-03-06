extends CharacterBody2D

@export var speed: float = 150.0
@export var gravity: float = 500.0
@export var scene_name: String = "LoseScreen2"

@onready var sprite = $AnimatedSprite2D


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_wall():
		speed *= -1
	sprite.play("default")
	velocity.x = speed
	move_and_slide()


func _process(_delta):
	if velocity.x != 0:
		if velocity.x > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/" + scene_name + ".tscn")
