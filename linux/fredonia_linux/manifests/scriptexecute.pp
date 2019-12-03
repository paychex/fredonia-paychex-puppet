class fredonia_linux::scriptexecute () {
  #create file to which timestamp will be written
  file { '/var/test/date.txt':
    ensure => 'present',
  }

  #Lay down script that we're going to execute
  file { '/usr/script1.py':
    ensure  => present,
    mode    => '0744',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/fredonia_linux/script1.py',
  }

  #execute script1.py
  exec { 'script1_execute':
    command => '/usr/bin/python3 /usr/script1.py',
    require => [ File['/var/test/date.txt'],  File['/usr/script1.py'] ]
  }
}
