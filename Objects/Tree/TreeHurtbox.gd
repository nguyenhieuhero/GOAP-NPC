extends Hurtbox
@export var animation: AnimationPlayer

func _on_area_entered(area: Hitbox):
	animation.play("being hit")
	if currentHealth < 0:
		print("out of heal")
	super(area)
