extends KinematicBody


export var rapidez=10
export var acce=5

export var gravedad=9.8
export var salto=20


onready var camara=$Camera
var velocidad=Vector3()

#Majena el movimiento
func _physics_process(delta):
	var mov=camara.get_global_transform().basis
	
	var dir=Vector3()
	
	if Input.is_action_pressed("mov_arriba"):
		dir-=mov.z
	elif Input.is_action_pressed("mov_abajo"):
		dir+=mov.z
	elif Input.is_action_pressed("mov_izquierda"):
		dir-=mov.x
	elif Input.is_action_pressed("mov_derecha"):
		dir+=mov.x
	
	dir=dir.normalized()
	velocidad=velocidad.linear_interpolate(dir*rapidez,acce*delta)
	velocidad=move_and_slide(velocidad)
	velocidad.y-=gravedad
	
	if Input.is_action_pressed("saltar"):
		velocidad.y+=salto
