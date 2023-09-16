extends Area2D
class_name Fruit


@export var fruit_name : String

var fruit_number : int
var bitter : int
var fruitful : int

func _ready():
	pass


func create_fruit(_name_fruit, _number_fruit, _bitterness, _fruitfulness):
	change_name(_name_fruit)
	change_number(_number_fruit)
	change_bitter(_bitterness)
	change_fruitful(_fruitfulness)


func change_name(_name):
	fruit_name = _name

func change_number(_number):
	fruit_number = _number

func change_bitter(_parent_bitter):
	bitter = _parent_bitter

func change_fruitful(_parent_fruitful):
	fruitful = _parent_fruitful
