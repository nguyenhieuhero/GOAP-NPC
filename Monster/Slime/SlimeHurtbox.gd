extends Hurtbox

@onready var animation = $"../AnimationPlayer"
func _on_area_entered(area):
	if currentHealth - area.dame < 0:
		animation.play('death')
		await animation.animation_finished	
	super(area)
	$"..".knockback(vectorDame)	
