/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] =
{
"Ubuntu Mono:bold:size=14",
"Symbols Nerd Font:size=13",
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */


static
const
char *colors[][2] = {
	/*               fg         bg       */
	[SchemeNorm] = { "#ffffff", "#111111" },
	[SchemeSel]  = { "#ffffff", "#202020" },
	[SchemeOut]  = { "#000000", "#00ffff" },
	[SchemeSelHighlight]  = { "#70a59b", "#202020" },
	[SchemeNormHighlight] = { "#70a59b", "#111111" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static unsigned int lineheight = 0;         /* -h option; minimum height of a menu line     */
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";


