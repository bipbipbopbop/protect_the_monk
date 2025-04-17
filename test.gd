extends Node2D

@export var leaf_scene: PackedScene

var score = 0;

func _ready():
	var left_basket = $Scale/LeftBasket
	left_basket.connect("leaf_entered_bucket", Callable(self, "_on_leaf_entered_bucket"))

	var right_basket = $Scale/RightBasket
	right_basket.connect("leaf_entered_bucket", Callable(self, "_on_leaf_entered_bucket"))


func _process(delta: float) -> void:
	pass

func _on_leaf_timer_timeout() -> void:
	# Create a new Leaf instance
	var leaf = leaf_scene.instantiate()

	# Choose a random location on Path2D
	var leaf_spawn_location = $Path2D/PathFollow2D
	leaf_spawn_location.progress_ratio = randf()
	leaf.position = leaf_spawn_location.position
	
	# Add the new leaf instance to the scene
	add_child(leaf)

func _on_leaf_entered_bucket():
	score += 5
	$HUD.update_score(score)
