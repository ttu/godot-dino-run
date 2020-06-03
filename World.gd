extends Node2D

var enemy = load("res://Enemy.tscn");
var timer = null


func _ready():
	var playerNode = get_tree().get_root().find_node("Player", true, false)
	playerNode.connect("collision", self, "_collision")
	
	_on_timer_timeout();
	
	timer = Timer.new()
	self.add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.set_wait_time(2.0)
	timer.set_one_shot(false)
	timer.start()
	
func _on_timer_timeout():
	var e = enemy.instance()
	e.name = "enemy"
	e.position = Vector2(1100, randi()%400)
	e.rotation_degrees = randi()%360
	e.applied_force = Vector2(-1000,500)
	e.mass = randf()*2.0
	self.add_child(e)

func _collision():
	print("Collision")
	#get_tree().paused = true
