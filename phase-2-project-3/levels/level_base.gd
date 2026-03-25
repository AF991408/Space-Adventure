extends Node2D
signal score_changed
var item_scene = load("res://items/item.tscn")
var score =0: set = set_score
var item_val=100

func _laser():
	for i in range(80):
		
		await get_tree().create_timer(1.5).timeout
		$laser/Sprite2D.visible=false
		$laser/CollisionShape2D.disabled=true
		$laser2/Sprite2D.visible=false
		$laser2/CollisionShape2D.disabled=true
		await get_tree().create_timer(1.5).timeout
		$laser/Sprite2D.visible=true
		$laser/CollisionShape2D.disabled=false
		$laser2/Sprite2D.visible=true
		$laser2/CollisionShape2D.disabled=false
		print("fish")

	
	

#func spawn_items():
	#var item_cells = $Items.get_used_cells(0)
	#for cell in item_cells:
		#var data = $Items.get_cell_tile_data(0,cell)
		#var type = data.get_custom_data("type")
		#var item = item_scene.instantiate() 
		#add_child(item)
		#item.init(type, $Items.map_to_local(cell))
		#item.picked_up.connect(self._on_item_picked_up)
		
func _on_item_picked_up():
	score +=1
	
func set_score(value):
	score = value
	score_changed.emit(score)
	
	
func _ready():
	_laser()
	$CanvasLayer/HUD/Label.visible=false
	$CanvasLayer/HUD/Label.text = "Hello World"
	
	score=Manager.score
	$AudioStreamPlayer2D.play()
	#$Items.hide()
	$Player.reset($SpawnPoint.position)
	#set_camera_limits()
	#spawn_items()

#func set_camera_limits():
	#var map_size = $World.get_used_rect()
	#var cell_size = $World.tile_set.tile_size
	#$Player/Camera2D.limit_left=(map_size.position.x-5) * cell_size.x
	#$Player/Camera2D.limit_right=(map_size.end.x+5)*cell_size.x
	



#func _on_player_died():
	#GameState.restart()


func _on_door_1_body_entered(body: Node2D) -> void:
	print("something")
	get_tree().change_scene_to_file("res://levels/level_02.tscn")
	Manager.score = score


func _on_doorth_body_entered(body: Node2D) -> void:
	print("period")
	get_tree().change_scene_to_file("res://levels/level_03.tscn")
	Manager.score = score


func _on_final_body_entered(body: Node2D) -> void:
	print("thing")
	Manager.score = score
	if Manager.score == 300:
		get_tree().change_scene_to_file("res://levels/level_04.tscn")
		print
	else:
		get_tree().change_scene_to_file("res://end.tscn")
	pass # Replace with function body.


func _on_item_body_entered(body: Node2D) -> void:
	score+=item_val
	item_val=0
	$AudioStreamPlayer2D2.play()
	$Item/CollisionShape2D.disabled=true
	$Item/Sprite2D.visible = false
	


func _on_item_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_speach_body_entered(body: Node2D) -> void:
	$CanvasLayer/HUD/Label.visible=true
	$AudioStreamPlayer2D.stop()
	$CanvasLayer/HUD/Label.text = "I'M BACK!"
	$yay.play()
	await get_tree().create_timer(1).timeout
	$CanvasLayer/HUD/Label.text = "also..."
	await get_tree().create_timer(1).timeout
	$CanvasLayer/HUD/Label.text = "Aliens are REAL!"
	$gasp.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://levels/end2.tscn")
	pass # Replace with function body.







func _on_laser_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#print("fish")
		$Player.hurt()
		pass # Replace with function body.


func _on_laser_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#print("fish")
		$Player.hurt()
	pass # Replace with function body.


func _on_oxygen_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("yo")
		$Player.gravity =350
		$AudioStreamPlayer2D2.play()
		await get_tree().create_timer(3).timeout
		$Player.gravity =750
	pass # Replace with function body.


func _on_spikes_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#print("fish")
		$Player.life=0
		$Player.hurt()
		$Player.hurt()
		$Player.hurt()
		pass # Replace with function body.


func _on_spikes_2_body_entered(body: Node2D) -> void:
		if body.is_in_group("Player"):
			print("toad")
			$Player.life=0
			$Player.hurt()
			$Player.hurt()
			$Player.hurt()
		pass # Replace with function body.
