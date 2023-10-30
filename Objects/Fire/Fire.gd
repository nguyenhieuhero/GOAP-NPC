extends StaticBody2D


func _ready():
	$AnimationPlayer.play("fire")
	await $AnimationPlayer.animation_finished	
	queue_free()
