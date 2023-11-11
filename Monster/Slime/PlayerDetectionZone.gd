extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		get_parent().get_parent().get_parent().get_node("Player").currentSanity -=  10
