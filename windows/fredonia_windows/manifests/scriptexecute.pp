class fredonia_windows::scriptexecute () {
  #Add parent directories!! 
  file{ 'C:\\fredonia-windows':
    ensure => 'directory',
  }

  file{ 'C:\\fredonia-windows\\windows':
    ensure => 'directory',
  }	

  file{ 'C:\\fredonia-windows\\windows\\Time-Script.ps1':
    ensure => 'present',
    source  => 'puppet:///modules/fredonia_windows/Time-Script.ps1',
  }

  exec{ 'script_execution':
    command => "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo –ExecutionPolicy Bypass -NonInteractive -File C:/fredonia-windows/windows/Time-Script.ps1"
  }
}
