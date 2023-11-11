extends StaticBody2D


func _ready():
	$AnimationPlayer.play("fire")
	await $AnimationPlayer.animation_finished	
	queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_parent().get_parent().get_node("GameWorld/Player").currentSanity += 5
