class fredonia_windows::services () {
	service { 'wuauserv':
	ensure => running,
	enable => true,
	}
	registry_value { 'HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\wuauserv\\DelayedAutostart':
	ensure => present,
	type => dword,
	data => 0x00000001
	}
	service { 'TrustedInstaller':
	ensure => running,
	enable => true,
	}
	service { 'msiserver':
	ensure => running,
	enable => true,
	}
	service { 'W32Time':
	ensure => running,
	enable => true,
	}
	service { 'MpsSvc':
	ensure => running,
	enable => true,
	}
	service { 'EventLog':
	ensure => running,
	enable => true,
	}
	service { 'RemoteRegistry':
	ensure => stopped,
	enable => false,
	}
}
#class{'fredonia_windows::services':}