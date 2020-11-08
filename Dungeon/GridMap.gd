extends GridMap

var noise := OpenSimplexNoise.new()

func _ready()->void:
	for x in range (5):
		for y in range (30):
			for z in range (10):
				if y < noise.get_noise_2d(x,z)*5+5:
					set_cell_item(x,y,z,0)
