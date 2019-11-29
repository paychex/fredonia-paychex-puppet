class fredonia_linux::scriptexecute () {
  #create file to which timestamp will be written
  file { '/var/test/date.txt':
    ensure => 'present',
  }
  #execute script1.py
  exec { 'script1_execute':
    command => 'python3 ~/fredonia-paychex-puppet/linux/script1.py',
    require => File['/var/test/date.txt'],
  }
}
