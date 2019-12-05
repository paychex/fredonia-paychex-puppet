class fredonia_linux::services () {
  #services to manage 
  #optional(if time allows): add notifications
  # to update log when services are run & track
  # for debugging 
  #Samba running and enabled
  package { 'samba':
    ensure => 'installed',
    before => Service['samba'],
  }
  service { 'samba':
    ensure => running,
    start  => 'sudo service smbd start',
    stop   => 'sudo service smbd stop',
    enable => true,
  }

  #cron running and enabled
  package {'cron':
    ensure => 'installed',
    before => Service['cron'],
  }
  service { 'cron':
    ensure => running,
    enable => true,
  }

  #ssh running and enabled
  package { 'ssh':
    ensure => 'installed',
    before => Service['ssh']
  }
  service { 'ssh':
    ensure => running,
    enable => true,
  }

  #httpd running and enabled
  package { 'apache2':
    ensure => 'present',
    before => Service['apache2']
  }
  service { 'apache2':
    ensure => running,
    enable => true,
  }

  #ntp running and enabled
  package { 'ntp':
    ensure => 'installed',
    before => Service['ntp'],
  }
  service { 'ntp':
    ensure => running,
    enable => true,
  }

  #iptables stopped and disabled
  package { 'iptables':
    ensure => 'installed',
    before => Service['ufw'],
  }
  service { 'ufw':
    ensure => stopped,
    enable => false
  }
}
