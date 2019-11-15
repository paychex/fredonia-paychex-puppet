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
  package { 'snap':
    ensure   => 'installed',
    provider => 'apt',
    before   => Exec['install http']
  }
  exec { 'install http':
    command => 'sudo snap install http',
    before  => Service['http'],
    path    => '/usr/bin',
  }
  service { 'http':
    ensure => running,
    enable => true,
  }

  #ntp running and enabled
  package {
    ensure   => 'installed',
    provider => 'apt',
    before   => Service['sntp'],
  }
  service { 'sntp':
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
