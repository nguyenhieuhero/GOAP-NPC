extends Node2D
@export var actor: Actor 

func _process(delta):
	if Input.is_action_just_pressed("axe"):
		actor.set_idle()
		actor.animation_tree.set("parameters/conditions/is_axe", true)
	if Input.is_action_just_pressed("action"):
		actor.set_idle()
		actor.animation_tree.set("parameters/conditions/is_pick", true)
	
