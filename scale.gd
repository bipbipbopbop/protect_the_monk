extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()


func _on_left_basket_body_entered(body: Node) -> void:
	pass # Replace with function body.


func _on_right_basket_body_entered(body: Node) -> void:
	pass # Replace with function body.
