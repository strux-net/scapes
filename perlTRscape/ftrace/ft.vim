se noswapfile
e /tmp/ft
SignifyToggle

syn clear
syn	match	exec	".*\t\zeex"		" dirty trick, use start of exec ...
hi	link	exec	Directory
syn	match	cwd	"ec in \zs.\+\ze ("	" use end of ... exec
hi	link	cwd	Directory
syn	match	summ	"^summary : .*"
hi	link	summ	Type
syn	match	removed	"\s*\zs.*\ze\tremoved"
syn	match	removed	"\s*\zs.*\ze\tdirectory removed"
hi	link	removed	WarningMsg
syn	match	renamed	"\s*\zs.*\ze\trenamed,"
syn	match	renamed	"\s*\zs.*\ze\tlinked"
hi	link	renamed LineNr
syn	match	touched	"\s*\zs.*\ze\ttouched"
hi	link	touched Identifier

set noswapfile
while 1|silent checktime|silent $|redraw|sleep 1|endwh
