extends Hurtbox

@onready var animation = $"../AnimationPlayer"
func _on_area_entered(area):
	area.get_parent().currentHealth -= 8
	area.get_parent().currentSanity -= 5
	if currentHealth - area.dame < 0:
		animation.play('death')
		await animation.animation_finished
	super(area)
