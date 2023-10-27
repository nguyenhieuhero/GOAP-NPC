extends Area2D

@export var inventory: InventoryResource


func _on_area_entered(area: Area2D):
	if area.has_method("collect"):
		if inventory.isFullSlot():
			return
		area.collect(inventory)
