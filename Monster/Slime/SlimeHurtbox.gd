extends Hurtbox

@onready var animation = $"../AnimationPlayer"
func _on_area_entered(area):
	print(get_parent().global_position)
	if currentHealth - area.dame < 0:
		animation.play('death')
		await animation.animation_finished
	super(area)
