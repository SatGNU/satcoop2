
// /*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
// Used as a positional target for spotlights, etc.
// */
// /void() info_null =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	remove(self);
// };
//
// /*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
// Used as a positional target for lightning.
// */
// void() info_notnull =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
// };
//
// //============================================================================
//
// float START_OFF = 1;
//
// void() light_use =
// {
// 	if (self.spawnflags & START_OFF)
// 	{
// 		lightstyle(self.style, "m");
// 		self.spawnflags = self.spawnflags - START_OFF;
// 	}
// 	else
// 	{
// 		lightstyle(self.style, "a");
// 		self.spawnflags = self.spawnflags + START_OFF;
// 	}
// };
//
// /*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) START_OFF
// Non-displayed light.
// Default light value is 300
// Default style is 0
// If targeted, it will toggle between on or off.
// */
// void() light =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	if (!self.targetname)
// 	{	// inert light
// 		remove(self);
// 		return;
// 	}
//
// 	if (self.style >= 32)
// 	{
// 		self.use = light_use;
// 		if (self.spawnflags & START_OFF)
// 			lightstyle(self.style, "a");
// 		else
// 			lightstyle(self.style, "m");
// 	}
// };
//
// /*QUAKED light_fluoro (0 1 0) (-8 -8 -8) (8 8 8) START_OFF
// Non-displayed light.
// Default light value is 300
// Default style is 0
// If targeted, it will toggle between on or off.
// Makes steady fluorescent humming sound
// */
// void() light_fluoro =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	if (self.style >= 32)
// 	{
// 		self.use = light_use;
// 		if (self.spawnflags & START_OFF)
// 			lightstyle(self.style, "a");
// 		else
// 			lightstyle(self.style, "m");
// 	}
//
// 	precache_sound ("ambience/fl_hum1.wav");
// 	ambientsound (self.origin, "ambience/fl_hum1.wav", 0.5, ATTN_STATIC);
// };
//
// /*QUAKED light_fluorospark (0 1 0) (-8 -8 -8) (8 8 8)
// Non-displayed light.
// Default light value is 300
// Default style is 10
// Makes sparking, broken fluorescent sound
// */
// void() light_fluorospark =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	if (!self.style)
// 		self.style = 10;
//
// 	precache_sound ("ambience/buzz1.wav");
// 	ambientsound (self.origin, "ambience/buzz1.wav", 0.5, ATTN_STATIC);
// };
//
// /*QUAKED light_globe (0 1 0) (-8 -8 -8) (8 8 8)
// Sphere globe light.
// Default light value is 300
// Default style is 0
// */
// void() light_globe =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	precache_model ("progs/s_light.spr");
// 	setmodel (self, "progs/s_light.spr");
// 	makestatic (self);
// };
//
/*QUAKED FireAmbient (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() FireAmbient =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/fire1.wav");
// attenuate fast
	ambientsound (self.origin, "ambience/fire1.wav", 0.5, ATTN_STATIC);
};

/*QUAKED ambient_fire (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
ambinet fire sound effects added for consistency
same as FireAmbient
*/
void() ambient_fire =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

FireAmbient();
};

//
// /*QUAKED light_torch_small_walltorch (0 .5 0) (-10 -10 -20) (10 10 20)
// Short wall torch
// Default light value is 200
// Default style is 0
// */
// void() light_torch_small_walltorch =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	precache_model ("progs/flame.mdl");
// 	setmodel (self, "progs/flame.mdl");
// 	FireAmbient ();
// 	makestatic (self);
// };
//
// /*QUAKED light_flame_large_yellow (0 1 0) (-10 -10 -12) (12 12 18)
// Large yellow flame ball
// */
// void() light_flame_large_yellow =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	precache_model ("progs/flame2.mdl");
// 	setmodel (self, "progs/flame2.mdl");
// 	self.frame = 1;
// 	FireAmbient ();
// 	makestatic (self);
// };
//
// /*QUAKED light_flame_small_yellow (0 1 0) (-8 -8 -8) (8 8 8) START_OFF
// Small yellow flame ball
// */
// void() light_flame_small_yellow =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	precache_model ("progs/flame2.mdl");
// 	setmodel (self, "progs/flame2.mdl");
// 	FireAmbient ();
// 	makestatic (self);
// };
//
// /*QUAKED light_flame_small_white (0 1 0) (-10 -10 -40) (10 10 40) START_OFF
// Small white flame ball
// */
// void() light_flame_small_white =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	precache_model ("progs/flame2.mdl");
// 	setmodel (self, "progs/flame2.mdl");
// 	FireAmbient ();
// 	makestatic (self);
// };
//
/*QUAKED light_candle (0 1 0) (-10 -10 -40) (10 10 40) START_OFF //dumptruck_ds taken from honey (originally from Rogue)
White candle
*/
void() light_candle =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_model ("progs/candle.mdl");
	setmodel (self, "progs/candle.mdl");
	makestatic (self);
};

void() model_candle_think =
{
	self.frame = self.frame + 1;
	if (self.frame > 3)
		self.frame = 0;
	self.nextthink = time + 0.1;
};

void() model_candle =
{

	precache_model ("progs/candle.mdl");

	setmodel (self, "progs/candle.mdl");

	self.think = model_candle_think;
	self.nextthink = time + 0.1;
};


//============================================================================


/*QUAKED misc_fireball (0 .5 .8) (-8 -8 -8) (8 8 8)
Lava Balls
*/

void() fire_fly;
void() fire_touch;
void() misc_fireball =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_model ("progs/lavaball.mdl");
	self.classname = "fireball";
	self.nextthink = time + (random() * 5);
	self.think = fire_fly;
	if (!self.speed)
		self.speed = 1000;
};

void() fire_fly =
{
local entity	fireball;

	fireball = spawn();
	fireball.solid = SOLID_TRIGGER;
	fireball.movetype = MOVETYPE_TOSS;
	fireball.velocity = '0 0 1000';
	fireball.velocity_x = (random() * 100) - 50;
	fireball.velocity_y = (random() * 100) - 50;
	fireball.velocity_z = self.speed + (random() * 200);
	fireball.classname = "fireball";
	setmodel (fireball, "progs/lavaball.mdl");
	setsize (fireball, '0 0 0', '0 0 0');
	setorigin (fireball, self.origin);
	fireball.nextthink = time + 5;
	fireball.think = SUB_Remove;
	fireball.touch = fire_touch;

	self.nextthink = time + (random() * 5) + 3;
	self.think = fire_fly;
};


void() fire_touch =
{
	T_Damage (other, self, self, 20);
	remove(self);
};

//============================================================================


void() barrel_explode =
{
	self.takedamage = DAMAGE_NO;
	self.classname = "explo_box";
	// did say self.owner
	T_RadiusDamage (self, self, 160, world);
	sound (self, CHAN_VOICE, "weapons/r_exp3.wav", 1, ATTN_NORM);
	particle (self.origin, '0 0 0', 75, 255);

	self.origin_z = self.origin_z + 32;
	BecomeExplosion ();
};



/*QUAKED misc_explobox (0 .5 .8) (0 0 0) (32 32 64)
TESTING THING
*/

void() misc_explobox =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	local float	oldz;

	self.solid = SOLID_BBOX;
	self.movetype = MOVETYPE_NONE;
	precache_model ("maps/b_explob.bsp");
	setmodel (self, "maps/b_explob.bsp");
	precache_sound ("weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = DAMAGE_AIM;

	self.origin_z = self.origin_z + 2;
	oldz = self.origin_z;
	droptofloor();
	if (oldz - self.origin_z > 250)
	{
		dprint ("item fell out of level at ");
		dprint (vtos(self.origin));
		dprint ("\n");
		remove(self);
	}
};




/*QUAKED misc_explobox2 (0 .5 .8) (0 0 0) (32 32 64)
Smaller exploding box, REGISTERED ONLY
*/

void() misc_explobox2 =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	local float	oldz;

	self.solid = SOLID_BBOX;
	self.movetype = MOVETYPE_NONE;
	precache_model2 ("maps/b_exbox2.bsp");
	setmodel (self, "maps/b_exbox2.bsp");
	precache_sound ("weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = DAMAGE_AIM;

	self.origin_z = self.origin_z + 2;
	oldz = self.origin_z;
	droptofloor();
	if (oldz - self.origin_z > 250)
	{
		dprint ("item fell out of level at ");
		dprint (vtos(self.origin));
		dprint ("\n");
		remove(self);
	}
};

/*==============================================================================
trap_spikeshooter from Hipnotic -- with additions by dumptruck_ds
==============================================================================*/

//MED 11/09/96 added new spawnflags -- taken from hipdefs.qc - dumptruck_ds
float SPAWNFLAG_SUPERSPIKE	= 1;
float SPAWNFLAG_LASER = 2;
float SPAWNFLAG_LAVABALL = 4;
float SPAWNFLAG_ROCKET = 8;
float SPAWNFLAG_VOREBALL = 16;
float SPAWNFLAG_GRENADE = 32;
float SPAWNFLAG_GIBS = 64;
float SPAWNFLAG_SILENT = 128;

void() ShalMissileTouch = //moved from Shalrath to enable shooter version
{
 if (other == self.owner)
	 return;		// don't explode on owner

 if (other.classname == "monster_zombie")
	 T_Damage (other, self, self, 110);
 T_RadiusDamage (self, self.owner, 40, world);
 sound (self, CHAN_WEAPON, "weapons/r_exp3.wav", 1, ATTN_NORM);

 WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
 WriteByte (MSG_BROADCAST, TE_EXPLOSION);
 WriteCoord (MSG_BROADCAST, self.origin_x);
 WriteCoord (MSG_BROADCAST, self.origin_y);
 WriteCoord (MSG_BROADCAST, self.origin_z);

 BecomeExplosion ();


 // self.velocity = '0 0 0';
 // self.touch = SUB_Null;
 // setmodel (self, "progs/s_explod.spr");
 // self.solid = SOLID_NOT;
 // s_explode1 ();
};

void() ZombieGrenadeTouch = //moved from zombie.qc to enable shooter version
{
	if (other == self.owner)
		return;         // don't explode on owner
	if (other.takedamage)
	{
		T_Damage (other, self, self.owner, 10 );
		sound (self, CHAN_WEAPON, "zombie/z_hit.wav", 1, ATTN_NORM);
		remove (self);
		return;
	}
	sound (self, CHAN_WEAPON, "zombie/z_miss.wav", 1, ATTN_NORM);   // bounce sound
	self.velocity = '0 0 0';
	self.avelocity = '0 0 0';
	self.touch = SUB_Remove;
};


void(vector org, vector vec) LaunchLaser;

//MED 11/09/96 added lava ball and rocket
//dumptruck_ds added voreball and grenades
void() spikeshooter_use =
{
   local entity lavaball;
   local entity voreball;
   local entity rockettrap;
   local entity gnade;
   local entity zgibs;

	if (self.spawnflags & SPAWNFLAG_LASER)
	{
      if (!(self.spawnflags & SPAWNFLAG_SILENT))
		  sound (self, CHAN_VOICE, "enforcer/enfire.wav", 1, ATTN_NORM);
			LaunchLaser (self.origin, self.movedir);
      newmis.spawnflags = self.spawnflags;
	}
   else if (self.spawnflags & SPAWNFLAG_LAVABALL)
   {
      if (!(self.spawnflags & SPAWNFLAG_SILENT))
      sound (self, CHAN_VOICE, "boss1/throw.wav", 1, ATTN_NORM); //dms
      // sound (self, CHAN_VOICE, "knight/sword2.wav", 1, ATTN_NORM); //dms
      // sound (self, CHAN_VOICE, "weapons/ax1.wav", 1, ATTN_NORM); //dms
      lavaball = spawn();
      lavaball.movetype = MOVETYPE_FLYMISSILE;
      lavaball.solid = SOLID_BBOX;
      lavaball.classname = "lavaball";
      // set lavaball speed
      lavaball.velocity = self.movedir * 600;  //was 300 dms
      lavaball.angles = vectoangles(lavaball.velocity);
      lavaball.owner = self;
      lavaball.touch = ShalMissileTouch;
      setmodel (lavaball, "progs/lavaball.mdl"); //dms
      setsize (lavaball, '0 0 0', '0 0 0');
      setorigin (lavaball, self.origin);
      lavaball.avelocity = '0 0 400';
      lavaball.nextthink = time + 5;
      lavaball.think = SUB_Remove;
   }

	 else if (self.spawnflags & SPAWNFLAG_ROCKET)
	 {
		 if (!(self.spawnflags & SPAWNFLAG_SILENT))
		 sound (self, CHAN_VOICE, "weapons/sgun1.wav", 1, ATTN_NORM);
		 rockettrap = spawn();
		 rockettrap.movetype = MOVETYPE_FLYMISSILE;
		 rockettrap.solid = SOLID_BBOX;
		 rockettrap.classname = "rockettrap";
		 // set rocket speed
		 rockettrap.velocity = self.movedir * 1000;
		 rockettrap.angles = vectoangles(rockettrap.velocity);
		 rockettrap.owner = self;
		 rockettrap.touch = T_MissileTouch;
		 setmodel (rockettrap, "progs/missile.mdl"); //dms
		 setsize (rockettrap, '0 0 0', '0 0 0');
		 setorigin (rockettrap, self.origin);
		 // rockettrap.avelocity = '0 0 400';
		 rockettrap.nextthink = time + 5;
		 rockettrap.think = SUB_Remove;
	 }
	 else if (self.spawnflags & SPAWNFLAG_VOREBALL)
	 {
		 if (!(self.spawnflags & SPAWNFLAG_SILENT))
		 sound (self, CHAN_VOICE, "shalrath/attack2.wav", 1, ATTN_NORM);
		 voreball = spawn();
		 voreball.movetype = MOVETYPE_FLYMISSILE;
		 voreball.solid = SOLID_BBOX;
		 voreball.classname = "voreball";
		 // set voreball speed
		 voreball.velocity = self.movedir * 600;  //was 300 dms
		 voreball.angles = vectoangles(voreball.velocity);
		 voreball.owner = self;
		 voreball.touch = ShalMissileTouch;
		 setmodel (voreball, "progs/v_spike.mdl"); //dms
		 setsize (voreball, '0 0 0', '0 0 0');
		 setorigin (voreball, self.origin);
		 voreball.avelocity = '0 0 400';
		 voreball.nextthink = time + 5;
		 voreball.think = SUB_Remove;
	 }

	 else if (self.spawnflags & SPAWNFLAG_GRENADE)
	 {
		 if (!(self.spawnflags & SPAWNFLAG_SILENT))
		 sound (self, CHAN_VOICE, "weapons/grenade.wav", 1, ATTN_NORM);
		 gnade = spawn();
		 gnade.movetype = MOVETYPE_BOUNCE;
		 // gnade.movetype = MOVETYPE_FLYMISSILE;
		 gnade.solid = SOLID_BBOX;
		 gnade.classname = "gnade";
		 // set grenade speed
		 // gnade.velocity = self.movedir * 600;  //was 300 dms
		 gnade.velocity = self.movedir * 600 + v_up * 200 + crandom()*v_right*10 + crandom()*v_up*10;
		 gnade.angles = vectoangles(gnade.velocity);
		 gnade.owner = self;
		 gnade.touch = GrenadeTouch;
		 setmodel (gnade, "progs/grenade.mdl"); //dms
		 setsize (gnade, '0 0 0', '0 0 0');
		 setorigin (gnade, self.origin);
		 gnade.avelocity = '300 300 300';
		 gnade.nextthink = time + 2.5;
	 	 gnade.think = GrenadeExplode;
	 }

	else if (self.spawnflags & SPAWNFLAG_GIBS)
	 {
	 	if (!(self.spawnflags & SPAWNFLAG_SILENT))
		sound (self, CHAN_VOICE, "zombie/z_shot1.wav", 1, ATTN_NORM);
	 	zgibs = spawn ();
	 	zgibs.owner = self;
	 	zgibs.movetype = MOVETYPE_BOUNCE;
	 	zgibs.solid = SOLID_BBOX;
		zgibs.classname = "zgibs";
		setmodel (zgibs, "progs/zom_gib.mdl");
		setsize (zgibs, '0 0 0', '0 0 0');
		setorigin (zgibs, self.origin);
	 	zgibs.velocity = self.movedir * 600 + v_up * 200 + crandom()*v_right*10 + crandom()*v_up*10;
	 	zgibs.avelocity = '3000 1000 2000';
	 	zgibs.touch = ZombieGrenadeTouch;
	 // set missile duration
	 	zgibs.nextthink = time + 2.5;
	 	zgibs.think = SUB_Remove;
	 }

   else
	{
  if (!(self.spawnflags & SPAWNFLAG_SILENT))
    sound (self, CHAN_VOICE, "weapons/spike2.wav", 1, ATTN_NORM);
		launch_spike (self.origin, self.movedir);
		newmis.velocity = self.movedir * 500;
		if (self.spawnflags & SPAWNFLAG_SUPERSPIKE)
			newmis.touch = superspike_touch;
	}
};

//MED 11/01/96 added state capability
void() shooter_think =
{
   if (self.state)
      {
      spikeshooter_use ();
      }
	 self.nextthink = time + self.wait;
};


/*QUAKED trap_spikeshooter (0 .5 .8) (-8 -8 -8) (8 8 8) superspike laser lavaball rocket silent
When triggered, fires a spike in the direction set in QuakeEd.
Laser is only for REGISTERED.
*/

//MED 11/01/96 commented out setmovedir
void() trap_spikeshooter =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

   SetMovedir ();
	self.use = spikeshooter_use;
	if (self.spawnflags & SPAWNFLAG_LASER)
	{
		precache_model2 ("progs/laser.mdl");

		precache_sound2 ("enforcer/enfire.wav");
		precache_sound2 ("enforcer/enfstop.wav");
	}
   else if (self.spawnflags & SPAWNFLAG_LAVABALL)
   {
      precache_model ("progs/lavaball.mdl");
      // precache_sound2 ("knight/sword2.wav"); //dms
      precache_sound2 ("boss1/throw.wav"); //dms
   }
   else if (self.spawnflags & SPAWNFLAG_ROCKET)
   {
      precache_model ("progs/missile.mdl");
      precache_sound ("weapons/sgun1.wav");
   }
   else if (self.spawnflags & SPAWNFLAG_VOREBALL)
   {
		 precache_model ("progs/v_spike.mdl");
		 precache_sound ("shalrath/attack2.wav");
   }
	 else if (self.spawnflags & SPAWNFLAG_GRENADE)
	 {
		precache_model ("progs/grenade.mdl");
		precache_sound ("weapons/grenade.wav");	// grenade launcher
	 }
	 else if (self.spawnflags & SPAWNFLAG_GIBS)
	 {
		precache_model ("progs/zom_gib.mdl");
		precache_sound ("zombie/z_shot1.wav");	// Zombie gibs
		precache_sound ("zombie/z_miss.wav");
		precache_sound ("zombie/z_hit.wav");
	 }

   else
		precache_sound ("weapons/spike2.wav");
};


/*QUAKED trap_shooter (0 .5 .8) (-8 -8 -8) (8 8 8) superspike laser lavaball rocket silent
Continuously fires spikes.
"wait" time between spike (1.0 default)
"nextthink" delay before firing first spike, so multiple shooters can be stagered.
*/
void() trap_shooter =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	trap_spikeshooter ();

	if (self.wait == 0)
		self.wait = 1;
//MED 11/01/96 added state capability
   self.state = 1;
	self.nextthink = self.nextthink + self.wait + self.ltime;
	self.think = shooter_think;
};

//MED 11/01/96 added new use function
void() trap_shooter_use =
   {
   self.state = 1 - self.state;
   };
//MED 11/01/96 added new function
/*QUAKED trap_switched_shooter (0 .5 .8) (-8 -8 -8) (8 8 8) superspike laser lavaball rocket silent
Continuously fires spikes.
"wait" time between spike (1.0 default)
"nextthink" delay before firing first spike, so multiple shooters can be stagered.
"state" 0 initially off, 1 initially on. (0 default)
*/
void() trap_switched_shooter =
 {
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

   trap_spikeshooter ();

	if (self.wait == 0)
		self.wait = 1;
//MED 11/01/96 added state capability
	self.nextthink = self.nextthink + self.wait + self.ltime;
	self.think = shooter_think;
   self.use = trap_shooter_use;
 };

/*
===============================================================================


===============================================================================
*/


void() make_bubbles;
void() bubble_remove;
void() bubble_bob;

/*QUAKED air_bubbles (0 .5 .8) (-8 -8 -8) (8 8 8)

testing air bubbles
*/

void() air_bubbles =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	if (deathmatch)
	{
		remove (self);
		return;
	}
	precache_model ("progs/s_bubble.spr");
	self.nextthink = time + 1;
	self.think = make_bubbles;
};

void() make_bubbles =
{
local entity	bubble;

	bubble = spawn();
	setmodel (bubble, "progs/s_bubble.spr");
	setorigin (bubble, self.origin);
	bubble.movetype = MOVETYPE_NOCLIP;
	bubble.solid = SOLID_NOT;
	bubble.velocity = '0 0 15';
	bubble.nextthink = time + 0.5;
	bubble.think = bubble_bob;
	bubble.touch = bubble_remove;
	bubble.classname = "bubble";
	bubble.frame = 0;
	bubble.cnt = 0;
	setsize (bubble, '-8 -8 -8', '8 8 8');
	self.nextthink = time + random() + 0.5;
	self.think = make_bubbles;
};

void() bubble_split =
{
local entity	bubble;
	bubble = spawn();
	setmodel (bubble, "progs/s_bubble.spr");
	setorigin (bubble, self.origin);
	bubble.movetype = MOVETYPE_NOCLIP;
	bubble.solid = SOLID_NOT;
	bubble.velocity = self.velocity;
	bubble.nextthink = time + 0.5;
	bubble.think = bubble_bob;
	bubble.touch = bubble_remove;
	bubble.classname = "bubble";
	bubble.frame = 1;
	bubble.cnt = 10;
	setsize (bubble, '-8 -8 -8', '8 8 8');
	self.frame = 1;
	self.cnt = 10;
	if (self.waterlevel != 3)
		remove (self);
};

void() bubble_remove =
{
	if (other.classname == self.classname)
	{
//		dprint ("bump");
		return;
	}
	remove(self);
};

void() bubble_bob =
{
local float		rnd1, rnd2, rnd3;


	self.cnt = self.cnt + 1;
	if (self.cnt == 4)
		bubble_split();
	if (self.cnt == 20)
		remove(self);

	rnd1 = self.velocity_x + (-10 + (random() * 20));
	rnd2 = self.velocity_y + (-10 + (random() * 20));
	rnd3 = self.velocity_z + 10 + random() * 10;

	if (rnd1 > 10)
		rnd1 = 5;
	if (rnd1 < -10)
		rnd1 = -5;

	if (rnd2 > 10)
		rnd2 = 5;
	if (rnd2 < -10)
		rnd2 = -5;

	if (rnd3 < 10)
		rnd3 = 15;
	if (rnd3 > 30)
		rnd3 = 25;

	self.velocity_x = rnd1;
	self.velocity_y = rnd2;
	self.velocity_z = rnd3;

	self.nextthink = time + 0.5;
	self.think = bubble_bob;
};

/*~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>
~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~<~>~*/

/*QUAKED viewthing (0 .5 .8) (-8 -8 -8) (8 8 8)

Just for the debugging level.  Don't use
*/

void() viewthing =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	self.movetype = MOVETYPE_NONE;
	self.solid = SOLID_NOT;
	precache_model ("progs/player.mdl");
	setmodel (self, "progs/player.mdl");
};


/*
==============================================================================

SIMPLE BMODELS

==============================================================================
*/

void() func_wall_use =
{	// change to alternate textures
	self.frame = 1 - self.frame;
};

/*QUAKED func_wall (0 .5 .8) ?
This is just a solid wall if not inhibitted
*/
void() func_wall =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	self.angles = '0 0 0';
	self.movetype = MOVETYPE_PUSH;	// so it doesn't get pushed by anything
	self.solid = SOLID_BSP;
	self.use = func_wall_use;
	setmodel (self, self.model);
};


/*QUAKED func_illusionary (0 .5 .8) ?
A simple entity that looks solid but lets you walk through it.
*/
void() func_illusionary =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	self.angles = '0 0 0';
	self.movetype = MOVETYPE_NONE;
	self.solid = SOLID_NOT;
	setmodel (self, self.model);
	makestatic (self);
};

/*QUAKED func_episodegate (0 .5 .8) ? E1 E2 E3 E4
This bmodel will appear if the episode has allready been completed, so players can't reenter it.
*/
void() func_episodegate =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	if (!(serverflags & self.spawnflags))
		return;			// can still enter episode

	self.angles = '0 0 0';
	self.movetype = MOVETYPE_PUSH;	// so it doesn't get pushed by anything
	self.solid = SOLID_BSP;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

/*QUAKED func_bossgate (0 .5 .8) ?
This bmodel appears unless players have all of the episode sigils.
*/
void() func_bossgate =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	if ( (serverflags & 15) == 15)
		return;		// all episodes completed
	self.angles = '0 0 0';
	self.movetype = MOVETYPE_PUSH;	// so it doesn't get pushed by anything
	self.solid = SOLID_BSP;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

//============================================================================
/*QUAKED ambient_suck_wind (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_suck_wind =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/suck1.wav");
	ambientsound (self.origin, "ambience/suck1.wav", 1, ATTN_STATIC);
};

/*QUAKED ambient_drone (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_drone =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/drone6.wav");
	ambientsound (self.origin, "ambience/drone6.wav", 0.5, ATTN_STATIC);
};

/*QUAKED ambient_flouro_buzz (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_flouro_buzz =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/buzz1.wav");
	ambientsound (self.origin, "ambience/buzz1.wav", 1, ATTN_STATIC);
};
/*QUAKED ambient_drip (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_drip =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/drip1.wav");
	ambientsound (self.origin, "ambience/drip1.wav", 0.5, ATTN_STATIC);
};
/*QUAKED ambient_comp_hum (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_comp_hum =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/comp1.wav");
	ambientsound (self.origin, "ambience/comp1.wav", 1, ATTN_STATIC);
};
/*QUAKED ambient_thunder (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
// void() ambient_thunder =
// {
// 	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
// 		return;
//
// 	precache_sound ("ambience/thunder1.wav");
// 	ambientsound (self.origin, "ambience/thunder1.wav", 0.5, ATTN_STATIC);
// };
/*QUAKED ambient_light_buzz (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_light_buzz =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/fl_hum1.wav");
	ambientsound (self.origin, "ambience/fl_hum1.wav", 0.5, ATTN_STATIC);
};
/*QUAKED ambient_swamp1 (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_swamp1 =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/swamp1.wav");
	ambientsound (self.origin, "ambience/swamp1.wav", 0.5, ATTN_STATIC);
};
/*QUAKED ambient_swamp2 (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_swamp2 =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/swamp2.wav");
	ambientsound (self.origin, "ambience/swamp2.wav", 0.5, ATTN_STATIC);
};
/////////////////////////////////////////////////////////////
////////// dumptruck_ds ////////////////////////////////////
///////////////////////////////////////////////////////////

/* Additions to Ambient Sound effects. These are hard coded into the engine and
   usually play back automatically when the sky or water textures are used. If
   you'd prefer to use these in custom setups, you can use the command line
   switch -nomabient in when you VIS your map to disable the hard coded sounds. */

/*QUAKED ambient_water1 (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_water1 =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/water1.wav");
	ambientsound (self.origin, "ambience/water1.wav", 1, ATTN_STATIC);
};
/*QUAKED ambient_wind2 (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_wind2 =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound ("ambience/wind2.wav");
	ambientsound (self.origin, "ambience/wind2.wav", 1, ATTN_STATIC);
};
/////////////////////////////////////////////////////////////
////////// dumptruck_ds ////////////////////////////////////
///////////////////////////////////////////////////////////

/* The original ambient_thunder was included in Quake but the code was missing.
   This version is borrowed from the Zerstörer mod but modified to only play the
   original thumder1.wav included in the game. This is also different than the
   other  ambient sounds as it plays back randomly as opposed to looping. You
   only need one  of these in your level. It will play everywhere. */

void() thunder_go_boom =
{
	if (random() < 0.5)
		sound (self, CHAN_AUTO, "ambience/thunder1.wav", 0.7, ATTN_NONE);
	else
		sound (self, CHAN_AUTO, "ambience/thunder1.wav", 1, ATTN_NONE);

	self.think = thunder_go_boom;
	self.nextthink = time + 40*random();
};

/*QUAKED ambient_thunder (0.3 0.1 0.6) (-10 -10 -8) (10 10 8)
*/
void() ambient_thunder =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	//  changed from ambient to delayed sound (sounds better)
	precache_sound ("ambience/thunder1.wav");
	// precache_sound ("ambience/thunder2.wav"); this file in not included in the game
	self.think = thunder_go_boom;
	self.nextthink = time + random();
};



//============================================================================

void() noise_think =
{
	self.nextthink = time + 0.5;
	sound (self, 1, "enforcer/enfire.wav", 1, ATTN_NORM);
	sound (self, 2, "enforcer/enfstop.wav", 1, ATTN_NORM);
	sound (self, 3, "enforcer/sight1.wav", 1, ATTN_NORM);
	sound (self, 4, "enforcer/sight2.wav", 1, ATTN_NORM);
	sound (self, 5, "enforcer/sight3.wav", 1, ATTN_NORM);
	sound (self, 6, "enforcer/sight4.wav", 1, ATTN_NORM);
	sound (self, 7, "enforcer/pain1.wav", 1, ATTN_NORM);
};

/*QUAKED misc_noisemaker (1 0.5 0) (-10 -10 -10) (10 10 10)

For optimzation testing, starts a lot of sounds.
*/

void() misc_noisemaker =
{
	if (SUB_Inhibit ())  // new spawnflags for all entities -- iw
		return;

	precache_sound2 ("enforcer/enfire.wav");
	precache_sound2 ("enforcer/enfstop.wav");
	precache_sound2 ("enforcer/sight1.wav");
	precache_sound2 ("enforcer/sight2.wav");
	precache_sound2 ("enforcer/sight3.wav");
	precache_sound2 ("enforcer/sight4.wav");
	precache_sound2 ("enforcer/pain1.wav");
	precache_sound2 ("enforcer/pain2.wav");
	precache_sound2 ("enforcer/death1.wav");
	precache_sound2 ("enforcer/idle1.wav");

	self.nextthink = time + 0.1 + random();
	self.think = noise_think;
};


/*SATCOOP func_interact (0 .5 .8) ?
"target" entity to trigger on interact.
 */
.float lastinteracted;
void(entity e, entity player) func_interact_oninteract =
{
	if(time < e.lastinteracted + e.wait) {
		return;
	}
	e.lastinteracted = time;

	entity oself = self;
	self = e;
	SUB_UseTargets();
	self = oself;
}

void() func_interact =
{
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	setorigin (self, self.origin);	
	setmodel (self, self.model);
	self.classname = "func_interact";
	self.oninteract = func_interact_oninteract;
}

// temporary
void(entity e, entity player) func_changemap_oninteract =
{
	// 1 is always the homebase map, but we let mappers count from 1
	float cid = e.cluster_id+1;
	sc_clustermap(cid, e.map);

	bprint("Resetting map on dimension ", ftos(cid), "\n");
}

void() func_changemap =
{
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	setorigin (self, self.origin);	
	setmodel (self, self.model);
	self.classname = "func_changemap";
	self.oninteract = func_changemap_oninteract;
}