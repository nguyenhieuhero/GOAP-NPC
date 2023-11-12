extends TextureProgressBar
func _process(delta):
	update()
func update(): 
		value = $"../..".currentHealth
