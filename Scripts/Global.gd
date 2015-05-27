extends Node

var count = 0
var changescene = null
var resume = false

func _ready():
	var root = get_tree().get_root()
	changescene = root.get_child(root.get_child_count() -1 )
	set_process_input(true)
	set_process(true)
	
func setscene(scene):
	var root = get_tree().get_root()
	changescene.queue_free()
	var S = load(scene)
	changescene = S.instance()
	root.add_child(changescene)

func setscenepause(scene):
	var root = get_tree().get_root()
	var S = load(scene)
	changescene = S.instance()
	root.add_child(changescene)
	
func TP():
			setscenepause("res://Scenes/MainMenu.scn")
			resume = true
			get_tree().set_pause(true)
			
func getresume():
	return resume
