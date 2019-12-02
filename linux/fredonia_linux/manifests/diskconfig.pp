class fredonia_linux::diskconfig () {
#Install prereq package
  package { 'parted':
    ensure => present,
  }
  exec {'/sbin/parted /dev/sdb mklabel msdos':
    unless  => '/sbin/blkid -t TYPE=ext4 /dev/sdb1',
    require => Package['parted'],
  }
  exec {'/sbin/parted /dev/sdb mkpart primary 1024KiB 100%':
    unless  => '/sbin/blkid -t TYPE=ext4 /dev/sdb1',
    require => Package['parted'],
  }
  exec {'/sbin/mkfs.ext4 /dev/sdb1':
    unless => '/sbin/blkid -t TYPE=ext4 /dev/sdb1'
  }
  file { '/var/test':
    ensure => 'directory',
  }
  mount { '/var/test/':
    ensure  => 'mounted',
    device  => '/dev/sdb1',
    fstype  => 'ext4',
    target  => '/etc/fstab',
    require => File['/var/test'],
  }
}
