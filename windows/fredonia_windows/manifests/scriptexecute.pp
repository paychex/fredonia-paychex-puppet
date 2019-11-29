class fredonia_windows::scriptexecute () {
	$path = 'C:/Users/user/Desktop/Time-Script.ps1'
	$powershell = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -NonInteractive'
	
	file{'C:\\fredonia-windows\\windows\\Time-Script.txt':
	ensure => 'present',
	}
	
	exec{ 'script_execution':
	command => "$powershell $path"
	}
}
