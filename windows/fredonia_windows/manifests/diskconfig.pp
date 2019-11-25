class fredonia_windows::diskconfig () {
  file { 'c:/os_config':
    ensure  => 'directory',
  }
  file { 'c:/os_config/diskscript.ps1':
    ensure => 'present',
    source => 'C:/ProgramData/PuppetLabs/windows/fredonia_windows/files/diskscript.ps1'
  }
  exec { 'provision drive':
    path      => $::path,
    timeout   => 300,
    creates   => 'c:/os_config/DiskInfo.txt',
    command   => 'c:/os_config/diskscript.ps1',
    provider  => 'powershell',
    logoutput => false,
  }
}
