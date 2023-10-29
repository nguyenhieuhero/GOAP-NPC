extends Area2D

@onready var inventory: InventoryResource

func _on_area_entered(area: Area2D):
	if area.has_method("collect"):
		area.collect(inventory)
