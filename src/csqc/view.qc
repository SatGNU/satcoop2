void Hud_Draw(vector scrsz);
void(vector pos, float value, float threshhold) Hud_DrawLargeValue;

void(float width, float height, float menushown) CSQC_UpdateView =
{
	if(con_size_x == 0 || con_size_y == 0) {
		con_size = (vector)getviewprop(VF_SCREENVSIZE);

		if(con_size_x == 0 || con_size_y == 0) {
			con_size_x = 1280;
			con_size_y = 720;
		}
	}

	clearscene();					//wipe entity lists. reset view properties to their defaults.
	setviewprop(VF_DRAWENGINESBAR, 0);		//draw a status bar (or hud or whatever the engine normally does) around the screen.
	setviewprop(VF_DRAWCROSSHAIR, 1);		//draw a crosshair in the middle of the screen.
	//setviewprop(VF_ORIGIN, '0 0 0');		//view position of the scene (after view_ofs effects).
	//setviewprop(VF_ANGLES, '0 0 0');		//override the view angles. input will work as normal. other players will see your player as normal. your screen will just be pointing a different direction.
	//setviewprop(VF_DRAWWORLD, 1);			//whether the world entity should be drawn. set to 0 if you want a completely empty scene.
	//setviewprop(VF_MIN, '0 0 0');			//top-left coord (x,y) of the scene viewport in virtual pixels (or annoying physical pixels in dp).
	//setviewprop(VF_SIZE, [width, height, 0]);	//virtual size (width,height) of the scene viewport in virtual pixels (or annoying physical pixels in dp).
	//setviewprop(VF_AFOV, cvar("fov"));		//note: fov_x and fov_y control individual axis. afov is general
	//setviewprop(VF_PERSPECTIVE, 1);		//1 means like quake and other 3d games. 0 means isometric.
	addentities((intermission?0:MASK_VIEWMODEL)|MASK_ENGINE);	//add various entities to the scene's lists.
	renderscene();					//draw the scene to the screen using the various properties.

	Hud_Draw(con_size); // ????? it puts the bar in the middle of dur screen
};

float stitems, stitems2, stweapon;
void Hud_Draw(vector scrsz)
{
	vector pos = [(scrsz_x-320)/2, scrsz_y - 24, 0];

	//get some commonly refered to values
	stitems = getstatbits(STAT_ITEMS, 0, 23);			//this is the player's self.items value (STAT_ITEMS is generated specially by the server)
	stitems2 = getstatbits(STAT_ITEMS, 23, 9);			//this is the player's self.items2 value if it exists, otherwise it is the serverflags global
	stweapon = getstatf(STAT_ACTIVEWEAPON);				//this is the player's self.weapon value.

	drawpic(pos, "sbar", '320 24 0', '1 1 1', 0.5, 0);		//draw the sbar background image slightly transparently

	Hud_DrawLargeValue(pos+'24 0 0', getstatf(STAT_ARMOR), 25);
	Hud_DrawLargeValue(pos+'136 0 0', getstatf(STAT_HEALTH), 25);
	Hud_DrawLargeValue(pos+'248 0 0', getstatf(STAT_AMMO), 10);
};

void(vector pos, float value, float threshhold) Hud_DrawLargeValue =
{
	float c;
	float len;
	string s;
	if (value < 0)
		value = 0;	//hrm
	if (value>999)
		value = 999;
	s = ftos(floor(value));
	len = strlen(s);
	pos_x += 24 * (3-len);
	if (value <= threshhold)
	{	//use alternate (red) numbers

		while(len>0)
		{
			len-=1;
			c = str2chr(s, len);
			drawpic(pos+len * '24 0 0', sprintf("anum_%g", c-'0'), '24 24 0', '1 1 1', 1, 0);
		}
	}
	else
	{	//use normal numbers

		while(len>0)
		{
			len-=1;
			c = str2chr(s, len);
			drawpic(pos+len * '24 0 0', sprintf("num_%g", c-'0'), '24 24 0', '1 1 1', 1, 0);
		}
	}
};