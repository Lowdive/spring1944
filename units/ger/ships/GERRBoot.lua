local GER_RBoot = ArmedBoat:New{
	name					= "Raumboot",
	description				= "Minesweeper (light patrol ship)",
	movementClass			= "BOAT_RiverMedium",
	acceleration			= 0.2,
	brakeRate				= 0.15,
	buildCostMetal			= 3873,
	collisionVolumeOffsets	= [[0.0 -16.0 -15.0]],
	collisionVolumeScales	= [[40.0 20.0 260.0]],
	maxDamage				= 16000,
	maxReverseVelocity		= 1.37,
	maxVelocity				= 2.52, -- 21kn
	transportCapacity		= 3, -- 3 x 1fpu turrets
	turnRate				= 65,	
	weapons = {	
		[1] = { -- give primary weapon for ranging
			name				= "flak4337mmap",
		},
	},
	customparams = {
		children = {
			"GERRBoot_Turret_37mm", 
			"GERRBoot_Turret_20mm",
			"GERRBoot_Turret_20mm",
		},
		deathanim = {
			["z"] = {angle = 45, speed = 15},
		},
		smokegenerator		=	1,
		smokeradius		=	300,
		smokeduration		=	40,
		smokecooldown		=	30,
		smokeceg		=	"SMOKESHELL_Medium",

	},
}

local GER_RBoot_Turret_37mm = OpenBoatTurret:New{
	name					= "37mm Turret",
	description				= "Primary Turret",
  	weapons = {	
		[1] = {
			name				= "flak4337mmap",
			maxAngleDif			= 270,
		},
		[2] = {
			name				= "flak4337mmhe",
			maxAngleDif			= 270,
		},
	},
	customparams = {
		maxammo					= 14,

		barrelrecoildist		= 4,
		barrelrecoilspeed		= 20,
		turretturnspeed			= 60,
		elevationspeed			= 30,

    },
}

local GER_RBoot_Turret_20mm = OpenBoatTurret:New{
	name					= "20mm Turret",
	description				= "20mm AA Turret",
  	weapons = {	
		[1] = {
			name				= "flak3820mmaa",
			maxAngleDif			= 270,
			onlyTargetCategory	= "AIR",
			mainDir		= [[0 0 -1]],
		},
		[2] = {
			name				= "flak3820mmhe",
			maxAngleDif			= 270,
			mainDir		= [[0 0 -1]],
		},
	},
	customparams = {
		maxammo					= 14,

		barrelrecoildist		= 4,
		barrelrecoilspeed		= 20,
		turretturnspeed			= 90,
		elevationspeed			= 80,
		aaweapon				= 1,
		facing					= 2,
		defaultheading1			= math.rad(180),
    },
}

return lowerkeys({
	["GERRBoot"] = GER_RBoot,
	["GERRBoot_Turret_37mm"] = GER_RBoot_Turret_37mm,
	["GERRBoot_Turret_20mm"] = GER_RBoot_Turret_20mm,
})
