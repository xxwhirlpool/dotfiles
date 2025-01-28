Require gallery-dl

Set Shell bash
Set WindowBar ColorfulRight
Set Theme "Catppuccin Frappe"
Set Width 600
Set Height 300
Set FontSize 15

Type 'cd "/home/kat/icon-demo"'
Enter
Type 'gallery-dl -g "r:https://magicalgifs.livejournal.com/11673.html" > i.txt'
Enter
Sleep 6.5s
Type 'edit txt file to isolate PB links'
Sleep 6.5s
Backspace 33
Type "gallery-dl -i i.txt"
Enter
Sleep 5.5s
Type 'ls gallery-dl/directlink'
Enter
Sleep 5.5s
