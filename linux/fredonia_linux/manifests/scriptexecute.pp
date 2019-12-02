class fredonia_linux::scriptexecute () {
  #create directory
 # file { '/var/test':
 #  ensure => 'directory',
 # }
  #create file to which timestamp will be written
  file { '/var/test/date.txt':
    ensure => 'present',
  }
  #execute script1.py
  exec { 'script1_execute':
    #path    => '/usr/bin',
    command => '/usr/bin/python3 /home/patrick/fredonia-paychex-puppet/linux/fredonia_linux/script1.py',
    require => File['/var/test/date.txt'],
  }
}
