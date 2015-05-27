
extends Node2D

var input_states = preload("res://scripts/input_states.gd")

var btn_escape= input_states.new("btn_escape")

var count = 0
var current_scene = null

func _ready():
	set_process(true)
	set_process_input(true)
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )

func _input(event):
	var resume = get_node("/root/globalsc").getresume()
	if resume != false:
		if event.is_action("ui_accept"):
			current_scene.queue_free()
			get_tree().set_pause(false)

func _process(delta):

	var resume = get_node("/root/globalsc").getresume()
	if resume != false:
		get_node("resume_button").show()

	if btn_escape.check() == 3 && !resume == false:
		print("escape")
		current_scene.queue_free()
		get_tree().set_pause(false)
		
func _on_options_button_pressed():
	get_node("/root/globalsc").setscene("res://Scenes/Options.scn")
	
func _on_play_button_pressed():
	get_node("/root/globalsc").setscene("res://Scenes/Game.scn")

func _on_exit_button_pressed():
	get_tree().quit()


func _on_resume_button_pressed():
	current_scene.queue_free()
	get_tree().set_pause(false)
