unit Share;

{ Global assets definations }
interface

const
	RUNLOGINCODE       = 0;			// Enter game status code, default 0, 9 for test

	STDCLIENT          = 0;
	RMCLIENT           = 99;
	CLIENTTYPE         = RMCLIENT;	// Normal is 0 , Manage Client is 99

	RMCLIENTTITLE      = 'Diamond?';


	DEBUG         = 0;
	SWH800        = 0;
	SWH1024       = 1;
	SWH           = SWH800;

	CUSTOMLIBFILE = 0; // Custom library file position

{$IF SWH = SWH800}
	SCREENWIDTH = 800;
	SCREENHEIGHT = 600;
{$ELSEIF SWH = SWH1024}
	SCREENWIDTH = 1024;
	SCREENHEIGHT = 768;
{$IFEND}

	MAPSURFACEWIDTH = SCREENWIDTH;
	MAPSURFACEHEIGHT = SCREENHEIGHT- 155;

	WINLEFT = 60;
	WINTOP  = 60;
	WINRIGHT = SCREENWIDTH-60;
	BOTTOMEDGE = SCREENHEIGHT-30;  // Bottom WINBOTTOM

	//! [Assets files path
	MAPDIR             = 'Map\'; // Map data files directory
	CONFIGFILE         = 'Config\%s.ini';
{$IF CUSTOMLIBFILE = 1}
	EFFECTIMAGEDIR     = 'Graphics\Effect\';
	MAINIMAGEFILE      = 'Graphics\FrmMain\Main.wil';
	MAINIMAGEFILE2     = 'Graphics\FrmMain\Main2.wil';
	MAINIMAGEFILE3     = 'Graphics\FrmMain\Main3.wil';
{$ELSE}
	MAINIMAGEFILE      = 'Data\Prguse.wil';
	MAINIMAGEFILE2     = 'Data\Prguse2.wil';
	MAINIMAGEFILE3     = 'Data\Prguse3.wil';
	EFFECTIMAGEDIR     = 'Data\';
{$IFEND}

	CHRSELIMAGEFILE    = 'Data\ChrSel.wil';
	MINMAPIMAGEFILE    = 'Data\mmap.wil';
	TITLESIMAGEFILE    = 'Data\Tiles.wil';
	SMLTITLESIMAGEFILE = 'Data\SmTiles.wil';
	HUMWINGIMAGESFILE  = 'Data\HumEffect.wil';
	MAGICONIMAGESFILE  = 'Data\MagIcon.wil';
	HUMIMGIMAGESFILE   = 'Data\Hum.wil';
	HAIRIMGIMAGESFILE  = 'Data\Hair.wil';
	WEAPONIMAGESFILE   = 'Data\Weapon.wil';
	NPCIMAGESFILE      = 'Data\Npc.wil';
	MAGICIMAGESFILE    = 'Data\Magic.wil';
	MAGIC2IMAGESFILE   = 'Data\Magic2.wil';
	EVENTEFFECTIMAGESFILE = EFFECTIMAGEDIR + 'Event.wil';
	BAGITEMIMAGESFILE   = 'Data\Items.wil';
	STATEITEMIMAGESFILE = 'Data\StateItem.wil';
	DNITEMIMAGESFILE    = 'Data\DnItems.wil';
	OBJECTIMAGEFILE     = 'Data\Objects.wil';
	OBJECTIMAGEFILE1    = 'Data\Objects%d.wil';
	MONIMAGEFILE        = 'Data\Mon%d.wil';
	DRAGONIMAGEFILE     = 'Data\Dragon.wil';
	EFFECTIMAGEFILE     = 'Data\Effect.wil';

	MONIMAGEFILEEX      = 'Graphics\Monster\%d.wil';	// Monster Image File Ex
	MONPMFILE           = 'Graphics\Monster\%d.pm';		// Monster PM File
	//! ]

	{
	MAXX = 40;
	MAXY = 40;
	}
	MAXX = SCREENWIDTH div 20;
	MAXY = SCREENWIDTH div 20;

	//! [Cursor
	DEFAULTCURSOR = 0;					// System Default Cursor
	IMAGECURSOR   = 1;					// Image Cursor
	USECURSOR     = DEFAULTCURSOR;		// Use Cursor
	//! ]

	MAXBAGITEMCL = 52;		// Max Bag Item Count
	MAXFONT = 8;			// Max Font
	ENEMYCOLOR = 69;

implementation

end.
