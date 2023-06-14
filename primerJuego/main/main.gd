extends Node2D

export (PackedScene) var Gem 

var level = 0
var time_left = 0
var score = 0

func _ready():
	OS.center_window()
	randomize()
	spawn_gems()
	time_left = 20


func _process(delta):
	if $GemContainer.get_child_count() == 0:
		level += 1 # level  = level + 1
		spawn_gems()
		time_left += 5

func spawn_gems():
	if Gem != null:
		for index in range ( 5 + level):
			var Gema = Gem.instance()
			Gema.position = Vector2(rand_range(0, 480), rand_range(0, 720))
			$GemContainer.add_child(Gema)
			


func _on_GameTimer_timeout():
	time_left -= 1 # time_left = time_left - 1
	$HUD.update_timer(time_left)
	if time_left <= 0:
		$GameTimer.stop()


func _on_player_picked():
	score += 1
	$HUD.update_score(score)
