extends Node2D

@onready var planets = {
	"Terran Wet": preload("res://Planets/Rivers/Rivers.tscn"),
	"Terran Dry": preload("res://Planets/DryTerran/DryTerran.tscn"),	
	"Islands": preload("res://Planets/LandMasses/LandMasses.tscn"),
	"No atmosphere": preload("res://Planets/NoAtmosphere/NoAtmosphere.tscn"),
	"Gas giant 1": preload("res://Planets/GasPlanet/GasPlanet.tscn"),
	"Gas giant 2": preload("res://Planets/GasPlanetLayers/GasPlanetLayers.tscn"),
	"Ice World": preload("res://Planets/IceWorld/IceWorld.tscn"),
	"Lava World": preload("res://Planets/LavaWorld/LavaWorld.tscn"),
	"Asteroid": preload("res://Planets/Asteroids/Asteroid.tscn"),
	"Black Hole": preload("res://Planets/BlackHole/BlackHole.tscn"),
	"Galaxy": preload("res://Planets/Galaxy/Galaxy.tscn"),
	"Star": preload("res://Planets/Star/Star.tscn"),
}

func _ready():
	generate_couple("Terran Wet", Vector2(100,100))
	generate_couple("Terran Dry", Vector2(400,100))
	generate_couple("Islands", Vector2(700,100))
	generate_couple("No atmosphere", Vector2(1000,100))
	generate_couple("Gas giant 1", Vector2(100,400))
	generate_couple("Gas giant 2", Vector2(400,400))
	generate_couple("Ice World", Vector2(700,400))
	generate_couple("Lava World", Vector2(1000,400))
	generate_couple("Asteroid", Vector2(100,700))
	generate_couple("Black Hole", Vector2(400,700))
	generate_couple("Galaxy", Vector2(700,700))
	generate_couple("Star", Vector2(1000,700))
	
func generate_couple(type:String, _position:Vector2):
	var planet:Control = planets[type].instantiate()
	planet.position = _position
	planet.z_index = 1
	add_child(planet)
	
	var planet2:Control = planets[type].instantiate()
	planet2.position = _position + Vector2(-50, -50)
	planet2.randomize_colors()
	planet2.set_pixels(200)
	planet2.set_seed(randi()%10000)
	add_child(planet2)
