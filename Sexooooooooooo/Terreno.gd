extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Terreno.create_trimesh_collision()
	$Terreno2.create_trimesh_collision()
