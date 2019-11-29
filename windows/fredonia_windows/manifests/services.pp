class fredonia_windows::services () {
	service { 'wuauserv':
	ensure => running,
	enable => true,
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
class{'fredonia_windows::services':}