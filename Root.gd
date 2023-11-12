extends Node2D

var state = "day"
var change_state = false
var length_of_day = 20
var length_of_night = 10
var countDay = 1
var hungerdecrease = 50
var sanitydecrease = 40
func _ready():
	if state == "day":
		$DayNight/countDay.text = "Day" + " " +str(countDay)
		$DayNight/DayNight.text = "Ngày"
		WorldState.set_state('is_day',true)
		$".".modulate = Color(1,1,1,1);
		print("Ngay", countDay)
	elif state == "night":
		$DayNight/DayNight.text = "Tối"
		WorldState.set_state('is_day',false)
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
			WorldState.set_state('is_day',true)
			countDay += 1
			$DayNight/countDay.text = "Day" + " " + str(countDay)
			$DayNight/DayNight.text = "Ngày"
			print("Ngay", countDay)
			decreaseStat()	
			change_to_day()
		elif state == "night":
			$DayNight/DayNight.text = "Tối"
			WorldState.set_state('is_day',false)
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
func decreaseStat():
	$Player.currentHunger -= hungerdecrease
	$Player.currentSanity -= sanitydecrease

