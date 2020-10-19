extends Spatial

#NOTA BENE COPIA INCOLLA DAL GENERATORE CASUALE, DESTINATO SOLO ALL'USO INTERNO
#AVVIA LA SCENA ALLEGATA PER FAR GENERARE IL TERRENO

#generatore di mappe:
export var pathImmagine = "res://Oggetti/player/circle.png"	#PERCORSO HEIGHTMAP
export var altezza = 1	#SCALARE CHE DETERMINA ALTEZZA FINALE
export var savePath = "res://Terreni/newHeightMap.tscn" #PERCORSO SALVATAGGIO TERRA CREATA

func _ready():
	var immagine = Image.new()
	immagine.load(pathImmagine)
	immagine.lock()
	
	var w = immagine.get_width()
	var h = immagine.get_height()
	randomize()
	var mesh = PlaneMesh.new()
	mesh.material = preload("../../shaderTerreniGenerati.tres")
	mesh.size = Vector2(w,h)
	mesh.subdivide_depth = h
	mesh.subdivide_width = w
	
	var surfTool = SurfaceTool.new()
	surfTool.create_from(mesh,0)
	var arrplane = surfTool.commit()		#prendo i punti del piano inizializzato
	
	var meshtool = MeshDataTool.new()
	meshtool.create_from_surface(arrplane,0)		#glieli passo da gestire a meshtool

	for i in range(meshtool.get_vertex_count()):		#prendo y da immagine
		var v = meshtool.get_vertex(i)
		v.y = immagine.get_pixel(abs(v.x)+w/2,abs(v.z)+h/2).r *altezza
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
	
	immagine.call_deferred("free")
	#inizializzare sistema dettagli:

	var packer = PackedScene.new()            #per salvare la mappa
	packer.pack(inst)
	ResourceSaver.save(savePath, packer)
	add_child(inst)

