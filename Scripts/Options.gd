
extends VBoxContainer

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process(true)
	set_process_input(true)



func _on_Return_pressed():
	get_node("/root/globalsc").setscene("res://Scenes/MainMenu.scn")
	
func _input(event):
	if event.is_action("ui_cancel") && event.is_pressed() && !event.is_echo():
		get_node("/root/globalsc").setscene("res://Scenes/MainMenu.scn")


