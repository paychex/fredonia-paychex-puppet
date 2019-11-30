class fredonia_windows::services () {
	registry_value { 'HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\wuauserv\\DelayedAutostart':
	ensure => present,
	type => dword,
	data => 0x00000001
	}
	service { 'wuauserv':
	ensure => running,
	enable => true,
	}

	service { 'TrustedInstaller':
	ensure => running,
	enable => true,
	start => "Automatic",
	}
	service { 'msiserver':
	ensure => running,
	enable => true,
	start => "Automatic",
	}
	service { 'W32Time':
	ensure => running,
	enable => true,
	start => "Automatic",
	}
	service { 'MpsSvc':
	ensure => running,
	enable => true,
	start => "Automatic",
	}
	service { 'EventLog':
	ensure => running,
	enable => true,
	start => "Automatic",
	}
	service { 'RemoteRegistry':
	ensure => stopped,
	enable => false,
	start => "Disabled",
	}
}
class{'fredonia_windows::services':}