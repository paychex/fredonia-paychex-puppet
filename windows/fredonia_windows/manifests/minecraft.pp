class fredonia_windows::minecraft () {
  #Create directory for java
  file { 'C:\Program Files\Java':
    ensure => 'directory',
  }

  #Create directory for minecraft
  file { 'C:\Program Files\Java\minecraft':
    ensure => 'directory',
  }

  #Download and unzip openjdk
  file { 'C:\Program Files\Java\openjdk.zip':
    ensure => present,
    source => "http://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/OpenJDK8U-jdk_x64_windows_hotspot_8u232b09.zip",
  }

  exec { 'Unzip openjdk files':
    path     => $::path,
    command  => 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -noprofile -Command {Expand-Archive -LiteralPath C:\Program Files\Java\openjdk.zip -DestinationPath C:\Program Files\Java\jdk}',
    unless   => 'Test-Path C:\Program Files\Java\jdk',
  }

  #Download server jar
  file { 'C:\Program Files\Java\minecraft\server.jar':
    ensure => present,
    source => "https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar",
  }

  #Accept eula
  file { 'C:\Program Files\Java\minecraft\eula.txt':
     content => 'eula=true',
     require => File[ 'C:\Program Files\Java\minecraft' ],
  }

  #Lay down bat file for minecraft server
  file { 'C:\Program Files\Java\minecraft\minecraft.bat':
    ensure => 'present',
    source => 'puppet:///modules/fredonia_windows/minecraft.bat',
  }

  exec { 'Create service for mc server':
    path     => $::path,
    command  => 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -noprofile -Command \{sc.exe create minecraft binPath="C:\Program Files\Java\minecraft\minecraft.bat"}',
    unless   => 'get-service minecraft',
  }
}
