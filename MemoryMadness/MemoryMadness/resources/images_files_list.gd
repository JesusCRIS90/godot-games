extends Resource

class_name ImageFilesList

@export var file_names: Array[String]


func add_filename(file: String) -> void:
	if !'.import' in file:
		file_names.append(file)


func get_file_names() -> Array[String]:
	return file_names
