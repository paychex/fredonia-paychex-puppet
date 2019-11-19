class fredonia_linux::services () {
  #services to manage 
  #optional(if time allows): add notifications
  # to update log when services are run & track
  # for debugging 
  #Samba running and enabled
  package {
    ensure   => 'installed',
    provider => 'apt',
    before   => Service['samba'],
  }
  service { 'samba':
    ensure => running,
    start  => '/usr/sbin/smbd service start',
    stop   => '/usr/sbin/smbd service stop',
    enable => true,
  }

  #cron running and enabled
  package {'cron':
    ensure   => 'installed',
    provider => 'apt',
    before   => Service['cron'],
  }
  service { 'cron':
    ensure => running,
    enable => true,
  }

  #ssh running and enabled
  package { 'ssh':
    ensure   => 'installed',
    provider => 'apt',
    before   => Service['ssh']
  }
  service { 'ssh':
    ensure => running,
    enable => true,
  }

  #httpd running and enabled
  package { 'apache2':
    ensure   => 'present',
    provider => 'apt',
    before   => Service['apache2']
  }
  service { 'apache2':
    ensure => running,
    enable => true,
  }

  #ntp running and enabled
  package { 'npt':
    ensure   => 'installed',
    provider => 'apt',
    before   => Service['ntp'],
  }
  service { 'ntp':
    ensure => running,
    enable => true,
  }

  #iptables stopped and disabled
  package { 'iptables':
    ensure   => 'installed',
    provider => 'apt',
    before   => Service['iptables'],
  }
  service { 'iptables':
    ensure => stopped,
    enable => false
  }
}
