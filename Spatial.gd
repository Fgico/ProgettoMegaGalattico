extends Spatial

#generatore di mappe:


func _ready():
	randomize()
	var mesh = PlaneMesh.new()
	mesh.material = preload("shaderTerreniGenerati.tres")
	mesh.size = Vector2(200,200)
	mesh.subdivide_depth = 200
	mesh.subdivide_width = 200
	
	var noise = OpenSimplexNoise.new()
	noise.seed = randi()			#casualizzo mappa
	
	var surfTool = SurfaceTool.new()
	surfTool.create_from(mesh,0)
	var arrplane = surfTool.commit()		#prendo i punti del piano inizializzato
	
	var meshtool = MeshDataTool.new()
	meshtool.create_from_surface(arrplane,0)		#glieli passo da gestire a meshtool

	for i in range(meshtool.get_vertex_count()):		#prendo y da rumore
		var v = meshtool.get_vertex(i)
		v.y = noise.get_noise_2d(v.x,v.z) *30
		meshtool.set_vertex(i, v)
	
	for i in range(arrplane.get_surface_count()):		#rimuovo superfici create all'inizializzazione del piano per farne altre
		arrplane.surface_remove(i)

	meshtool.commit_to_surface(arrplane)
	
	surfTool.begin(mesh.PRIMITIVE_TRIANGLES)		#comincio a estrarre la mesh finale
	surfTool.create_from(arrplane,0)
	surfTool.generate_normals()
	
	var inst = MeshInstance.new()
	inst.mesh = surfTool.commit()
	inst.create_trimesh_collision()
	
	#inizializzare sistema dettagli:

	var packer = PackedScene.new()            #per salvare la mappa
	packer.pack(inst)
	ResourceSaver.save("res://terra.tscn", packer)
	add_child(inst)






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
