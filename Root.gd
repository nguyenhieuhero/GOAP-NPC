extends Node2D

var state = "day"
var change_state = false
var length_of_day = 10
var length_of_night = 10
var countDay = 1
var healthdecrease = 30
func _ready():
	if state == "day": 
		$".".modulate = Color(1,1,1,1);
		print("Ngay", countDay)
	elif state == "night": 
		$".".modulate = Color(172,172,172,120);
func _on_timer_timeout():
	if state == "day": 
		state = "night"
	elif state == "night":
		state = "day"
	change_state = true
func _process(delta):
	if change_state == true: 
		change_state = false
		if state == "day": 
			countDay += 1
			print("Ngay", countDay)
			decreaseHealth()	
			change_to_day()
		elif state == "night":
			change_to_night()				
func change_to_day():
	$AnimationPlayer.play("nighttoday")
	$Timer.wait_time = length_of_day
	$Timer.start()
	$Timer["autostart"] = true
func change_to_night():
	$AnimationPlayer.play("daytonight")
	$Timer.wait_time = length_of_night
	$Timer.start()	
	$Timer["autostart"] = true
func decreaseHealth():
	$Player.currentHealth -= healthdecrease
	if $Player.currentHealth < 0: 
		print('game over')
	print($Player.currentHealth)

