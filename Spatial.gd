extends Spatial

#generatore di mappe:


func _ready():
	var mesh = PlaneMesh.new()
	mesh.material = preload("new_spatialmaterial.tres")
	mesh.size = Vector2(1000,1000)
	mesh.subdivide_depth = 100
	mesh.subdivide_width = 100
	
	var noise = OpenSimplexNoise.new()
	noise.seed = randi()
	
	var surfTool = SurfaceTool.new()
	surfTool.create_from(mesh,0)
	var arrplane = surfTool.commit()
	
	var meshtool = MeshDataTool.new()
	meshtool.create_from_surface(arrplane,0)

	for i in range(meshtool.get_vertex_count()):
		var v = meshtool.get_vertex(i)
		v.y = noise.get_noise_2d(v.x,v.z) *100
		meshtool.set_vertex(i, v)
	
	for i in range(arrplane.get_surface_count()):
		arrplane.surface_remove(i)

	meshtool.commit_to_surface(arrplane)
	
	surfTool.begin(mesh.PRIMITIVE_TRIANGLES)
	surfTool.create_from(arrplane,0)
	surfTool.generate_normals()
	
	var inst = MeshInstance.new()
	inst.mesh = surfTool.commit()
	inst.create_trimesh_collision()
	
	var packer = PackedScene.new()            #per salvare la mappa
	packer.pack(inst)
	ResourceSaver.save("res://terra.tscn", packer)
	add_child(inst)






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
