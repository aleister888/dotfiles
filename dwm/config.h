/*     _      _     _            ___   ___   ___        _                      _           _ _     _ 
  __ _| | ___(_)___| |_ ___ _ __( _ ) ( _ ) ( _ )    __| |_      ___ __ ___   | |__  _   _(_) | __| |
 / _` | |/ _ \ / __| __/ _ \ '__/ _ \ / _ \ / _ \   / _` \ \ /\ / / '_ ` _ \  | '_ \| | | | | |/ _` |
| (_| | |  __/ \__ \ ||  __/ | | (_) | (_) | (_) | | (_| |\ V  V /| | | | | | | |_) | |_| | | | (_| |
 \__,_|_|\___|_|___/\__\___|_|  \___/ \___/ \___/   \__,_| \_/\_/ |_| |_| |_| |_.__/ \__,_|_|_|\__,_|
*/

/* appearance */
static const unsigned int borderpx       = 5;   /* border pixel of windows */
static const unsigned int snap           = 0;  /* snap pixel */
static const unsigned int gappih         = 12;  /* horiz inner gap between windows */
static const unsigned int gappiv         = 12;  /* vert inner gap between windows */
static const unsigned int gappoh         = 8;  /* horiz outer gap between windows and screen edge */
static const unsigned int gappov         = 8;  /* vert outer gap between windows and screen edge */
static const int smartgaps_fact          = 1;   /* gap factor when there is only one client; 0 = no gaps, 3 = 3x outer gaps */
static const char autostartblocksh[]     = "autostart_blocking.sh";
static const char autostartsh[]          = "autostart.sh";
static const char dwmdir[]               = "dwm";
static const char localshare[]           = ".local/share";
static const int showbar                 = 1;   /* 0 means no bar */
static const int topbar                  = 1;   /* 0 means bottom bar */
/* Status is to be shown on: -1 (all monitors), 0 (a specific monitor by index), 'A' (active monitor) */
static const int statusmon               = 'A';
static const unsigned int systrayspacing = 0;   /* systray spacing */
static const int showsystray             = 1;   /* 0 means no systray */

/* Indicators: see patch/bar_indicators.h for options */
static int tagindicatortype              = INDICATOR_TOP_LEFT_SQUARE;
static int tiledindicatortype            = INDICATOR_NONE;
static int floatindicatortype            = INDICATOR_TOP_LEFT_SQUARE;
static const char *fonts[] = { "Ubuntu Mono:bold:size=14",
"Symbols Nerd Font:size=12" };

static const char dmenufont[]            = "monospace:size=10";

/* colorscheme */
static char c000000[]                    = "#000000"; // placeholder value

static char normfgcolor[]                = "#ffffff";
static char normbgcolor[]                = "#111111";
static char normbordercolor[]            = "#111111";
static char normfloatcolor[]             = "#111111";

static char selfgcolor[]                 = "#ffffff";
static char selbgcolor[]                 = "#202020";
static char selbordercolor[]             = "#202020";
static char selfloatcolor[]              = "#202020";

static char titlenormfgcolor[]           = "#ffffff";
static char titlenormbgcolor[]           = "#111111";
static char titlenormbordercolor[]       = "#111111";
static char titlenormfloatcolor[]        = "#111111";

static char titleselfgcolor[]            = "#ffffff";
static char titleselbgcolor[]            = "#202020";
static char titleselbordercolor[]        = "#202020";
static char titleselfloatcolor[]         = "#202020";

static char tagsnormfgcolor[]            = "#ffffff";
static char tagsnormbgcolor[]            = "#111111";
static char tagsnormbordercolor[]        = "#111111";
static char tagsnormfloatcolor[]         = "#111111";

static char tagsselfgcolor[]             = "#ffffff";
static char tagsselbgcolor[]             = "#111111";
static char tagsselbordercolor[]         = "#111111";
static char tagsselfloatcolor[]          = "#111111";

static char hidnormfgcolor[]             = "#ffffff";
static char hidselfgcolor[]              = "#416566";
static char hidnormbgcolor[]             = "#111111";
static char hidselbgcolor[]              = "#111111";

static char urgfgcolor[]                 = "#bbbbbb";
static char urgbgcolor[]                 = "#171d1f";
static char urgbordercolor[]             = "#ff0000";
static char urgfloatcolor[]              = "#db8fd9";

static char *colors[][ColCount] = {
	/*                       fg                bg                border                float */
	[SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor,      normfloatcolor },
	[SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor,       selfloatcolor },
	[SchemeTitleNorm]    = { titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor },
	[SchemeTitleSel]     = { titleselfgcolor,  titleselbgcolor,  titleselbordercolor,  titleselfloatcolor },
	[SchemeTagsNorm]     = { tagsnormfgcolor,  tagsnormbgcolor,  tagsnormbordercolor,  tagsnormfloatcolor },
	[SchemeTagsSel]      = { tagsselfgcolor,   tagsselbgcolor,   tagsselbordercolor,   tagsselfloatcolor },
	[SchemeHidNorm]      = { hidnormfgcolor,   hidnormbgcolor,   c000000,              c000000 },
	[SchemeHidSel]       = { hidselfgcolor,    hidselbgcolor,    c000000,              c000000 },
	[SchemeUrg]          = { urgfgcolor,       urgbgcolor,       urgbordercolor,       urgfloatcolor },
};

const char *spcmd1[] = {"spterm", NULL };
static Sp scratchpads[] = {
   /* name          cmd  */
   {"spterm",      spcmd1},
};

/* tags-names */
static char *tagicons[][NUMTAGS] = {
	[DEFAULT_TAGS]        = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
};

static const Rule rules[] = {
	RULE(.wintype = WTYPE "DIALOG", .isfloating = 1)
	RULE(.wintype = WTYPE "UTILITY", .isfloating = 1)
	RULE(.wintype = WTYPE "TOOLBAR", .isfloating = 1)
	RULE(.wintype = WTYPE "SPLASH", .isfloating = 1)
        RULE(.class = "Gcolor3", .isfloating = 1)
        RULE(.class = "Gnome-calculator", .isfloating = 1)
        RULE(.class = "MultiMC", .isfloating = 1)
        RULE(.class = "Pavucontrol", .isfloating = 1)
	RULE(.instance = "spterm", .isfloating = 1)
};

/* layout(s) */
static const BarRule barrules[] = {
	/* monitor   bar    alignment         widthfunc                drawfunc                clickfunc                name */
	{ -1,        0,     BAR_ALIGN_LEFT,   width_tags,              draw_tags,              click_tags,              "tags" },
	{  0,        0,     BAR_ALIGN_RIGHT,  width_systray,           draw_systray,           click_systray,           "systray" },
	{ -1,        0,     BAR_ALIGN_LEFT,   width_ltsymbol,          draw_ltsymbol,          click_ltsymbol,          "layout" },
	{ statusmon, 0,     BAR_ALIGN_RIGHT,  width_status,            draw_status,            click_status,            "status" },
	{ -1,        0,     BAR_ALIGN_NONE,   width_wintitle,          draw_wintitle,          click_wintitle,          "wintitle" },
};

/* layout(s) */
static const float mfact     = 0.575; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "[\\]",     dwindle },
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} }, \
	{ MODKEY|Mod1Mask|ShiftMask,    KEY,      swaptags,       {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { NULL };
static const char *termcmd[]  = { NULL };

static Key keys[] = {
	/* modifier                     key            function                argument */
	{ MODKEY,                       XK_b,          togglebar,              {0} },
	// change focus
	{ MODKEY,                       XK_Right,      focusstack,             {.i = +1 } },
	{ MODKEY,                       XK_Left,       focusstack,             {.i = -1 } },
	// move windows
	{ MODKEY|ShiftMask,             XK_Right,      rotatestack,            {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Left,       rotatestack,            {.i = -1 } },
	// increase/decrease stack
	{ MODKEY,                       XK_j,          incnmaster,             {.i = +1 } },
	{ MODKEY,                       XK_k,          incnmaster,             {.i = -1 } },
	// increase/decrease stack size
	{ MODKEY,                       XK_u,          setmfact,               {.f = -0.025} },
	{ MODKEY,                       XK_i,          setmfact,               {.f = +0.025} },
	// swap master/stack window
        { MODKEY|ControlMask,           XK_Left,       zoom,                   {0} },
        { MODKEY|ControlMask,           XK_Right,      zoom,                   {0} },
	// increase/decrease gaps
	{ MODKEY,                       XK_f,          incrgaps,               {.i = -10 } },
	{ MODKEY,                       XK_g,          incrgaps,               {.i = +10 } },
	//
	{ MODKEY,                       XK_0,          view,                   {0} },
	{ MODKEY|ShiftMask,             XK_q,          killclient,             {0} },
	{ MODKEY|ShiftMask,             XK_F11,        quit,                   {0} },
	{ MODKEY|ShiftMask,             XK_space,      togglefloating,         {0} },
	// scratchpads
	{ MODKEY,                       XK_s,          togglescratch,          {.ui = 0 } },
	{ MODKEY|ShiftMask,             XK_s,          setscratch,             {.ui = 0 } },
	{ MODKEY|ControlMask,           XK_s,          removescratch,          {.ui = 0 } },
	// monitor control
	{ MODKEY,                       XK_comma,      focusmon,               {.i = -1 } },
	{ MODKEY,                       XK_period,     focusmon,               {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,      tagmon,                 {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,     tagmon,                 {.i = +1 } },
	// change layout
	{ MODKEY,                       XK_Tab,        cyclelayout,            {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Tab,        cyclelayout,            {.i = -1 } },
	TAGKEYS(                        XK_1,                                  0)
	TAGKEYS(                        XK_2,                                  1)
	TAGKEYS(                        XK_3,                                  2)
	TAGKEYS(                        XK_4,                                  3)
	TAGKEYS(                        XK_5,                                  4)
	TAGKEYS(                        XK_6,                                  5)
	TAGKEYS(                        XK_7,                                  6)
	TAGKEYS(                        XK_8,                                  7)
	TAGKEYS(                        XK_9,                                  8)
};


/* button definitions */
static Button buttons[] = {
	/* click                event mask           button          function        argument */
	{ ClkLtSymbol,          0,                   Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,                   Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,                   Button2,        zoom,           {0} },
	{ ClkStatusText,        0,                   Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,              Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,              Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,              Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,                   Button1,        view,           {0} },
	{ ClkTagBar,            0,                   Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,              Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,              Button3,        toggletag,      {0} },
};
