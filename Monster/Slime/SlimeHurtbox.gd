extends Hurtbox
var decreaseHealth = 5
@onready var animation = $"../AnimationPlayer"
func _on_area_entered(area):
	print(get_parent().global_position)
	get_parent().get_parent().get_parent().get_node("Player").currentHealth -=  decreaseHealth
	if currentHealth - area.dame < 0:
		animation.play('death')
		await animation.animation_finished		
	super(area)
