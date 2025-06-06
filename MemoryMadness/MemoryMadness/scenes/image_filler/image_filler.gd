@tool
extends Node

const PATH: String = "res://assets/glitch/"
const RESOURCE_PATH: String = "res://resources/images_files_list.tres"

func _ready():
	var dir: DirAccess = DirAccess.open(PATH)
	var ifl: ImageFilesList = ImageFilesList.new()
	
	if dir:
		var files: PackedStringArray = dir.get_files()
		
		for file in files:
			print(file)
			ifl.add_filename(PATH + file)
	ResourceSaver.save(ifl, RESOURCE_PATH)


