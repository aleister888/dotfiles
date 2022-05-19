#define CMDLENGTH 40
#define DELIMITER "  "

const Block blocks[] = {
// Prints current song
BLOCK("$HOME/.local/scripts/sb/sb-tauon-print",    1,    0),
// Prints current kernel
BLOCK("$HOME/.local/scripts/sb/sb-kernel",    0,    0),
// Prints battery level and status
BLOCK("$HOME/.local/scripts/sb/sb-battery",    5,    0),
// Prints volueme level and status
BLOCK("$HOME/.local/scripts/sb/sb-volume",    1,    0),
// Prints ram usage
BLOCK("$HOME/.local/scripts/sb/sb-mem",    10,    0),
// Prints disk space
BLOCK("$HOME/.local/scripts/sb/sb-disk",    60,    0),
// Prrints cpu temp
BLOCK("$HOME/.local/scripts/sb/sb-cpu", 1,    0),
// Prints date and time
BLOCK("$HOME/.local/scripts/sb/sb-time",    60,    0),
};
