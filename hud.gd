extends CanvasLayer
	
func update_score(score):
	print(score)
	$ScoreLabel.text = "Score: " + str(score)
