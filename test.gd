extends Node2D

@export var leaf_scene: PackedScene

func _process(delta: float) -> void:
	pass

func _on_leaf_timer_timeout() -> void:
	print_debug("test")
	# Create a new Leaf instance
	var leaf = leaf_scene.instantiate()

	# Choose a random location on Path2D
	var leaf_spawn_location = $Path2D/PathFollow2D
	leaf_spawn_location.progress_ratio = randf()
	leaf.position = leaf_spawn_location.position
	
	# Add the new leaf instance to the scene
	add_child(leaf)
