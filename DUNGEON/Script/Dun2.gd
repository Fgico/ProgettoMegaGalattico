extends Spatial

	#aggiorno posizione player per ogni dungeon
	if( pianoAttuale.get_node("startPos") != null):
		var startPos = pianoAttuale.get_node("startPos")
		player.global_transform.origin = startPos.global_transform.origin
