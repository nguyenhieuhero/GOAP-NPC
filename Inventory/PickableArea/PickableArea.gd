extends Area2D

@onready var inventory: InventoryResource = preload("res://Player/Inventory.tres")


func _on_area_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)
