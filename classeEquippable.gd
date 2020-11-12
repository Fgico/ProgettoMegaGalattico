extends TouchScreenButton

var mesh
var icon

const Weapon = 0
const Armor = 1
var kind 

var level = 1
var power = 1
var spd = 1

func creaItem(nmesh, nicon, nkind = Weapon, nlevel = 1, npower = 1, nspd = 1):
	mesh = nmesh
	icon = nicon
	kind = nkind
	level = nlevel
	power = npower
	spd = nspd


