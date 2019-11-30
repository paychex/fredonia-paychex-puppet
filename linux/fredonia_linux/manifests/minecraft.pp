# not sure what this does but causes errors -> {code:java}

class fredonia_linux::minecraft () {
  exec { 'create firewall rule for mc server' :
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
  command => '/usr/bin/firewall-cmd --zone=public --add-port=25565/tcp --perman$
  unless  => '/usr/bin/firewall-cmd --zone=public --list-ports | /bin/grep 2556$
  }
  #Install openjdk
  package { [ 'openjdk-8-jdk', ]:
    ensure  => 'present',
  }
  #Install firewalld
  package { 'firewalld':
    ensure => 'present',
    before => Exec['create firewall rule for mc server'],
  }
  #Add user for the service
  user { 'mcuser':
    ensure => present,
  }
  #Create directory for the app
  file { '/opt/minecraft':
    ensure  => 'directory',
    owner   => mcuser,
    group   => 'users',
    mode    => '0755',
    require => User[ mcuser ],
  }
  #Download server jar
  file { "/opt/minecraft/server.jar":
    ensure  => present,
    source => "https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar",
  }
  #Accept eula
  file { '/opt/minecraft/eula.txt':
    content => 'eula=true',
    require => File[ '/opt/minecraft' ],
  }
  #Lay down Minecraft server service file
  file { '/etc/systemd/system/minecraft.service':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/fredonia_linux/mcservicetemplate.svc',
  }
  #Ensure service is running
  service { 'minecraft':
    enable  => true,
    ensure  => "running",
    require => File['/etc/systemd/system/minecraft.service'],
  }
}

#Example service file:
# Not sure where to put this in the modulepath so that puppet can
# find it.
[Unit]
Description=Minecraft server
After=network.target[Service]
Type=simple
User=mcuser
WorkingDirectory=/opt/minecraft
ExecStart=/usr/bin/java -Xmx1024M -Xms1024M -jar /opt/minecraft/server.jar nogui
Restart=on-failure
[Install]
WantedBy=multi-user.target{code}
