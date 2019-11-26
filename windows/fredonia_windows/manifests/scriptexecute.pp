class fredonia_windows::scriptexecute () {
	$path = 'C:/Users/user/Desktop/Time-Script.ps1'
	$powershell = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -NonInteractive'
	exec{ 'script_execution':
	command => "$powershell $path"
	}
}
include fredonia_windows::scriptexecute
