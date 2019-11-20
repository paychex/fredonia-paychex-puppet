class fredonia_linux::diskconfig () {
#Install prereq package
  package { 'parted':
    ensure => present,
  }
  exec {'/usr/sbin/parted /dev/sdc mklabel msdos':
    unless => '/sbin/blkid -t TYPE=ext4 /dev/sdc1'
  }
  exec {'/usr/sbin/parted /dev/sdc mkpart primary 1024KiB 100%':
    unless => '/sbin/blkid -t TYPE=ext4 /dev/sdc1'
  }
  exec {'/sbin/mkfs.ext4 /dev/sdc1':
    unless => '/sbin/blkid -t TYPE=ext4 /dev/sdc1'
  }
  file { '/var/test':
    ensure => 'directory',
  }mount { '/var/test/':
    ensure  => 'mounted',
    device  => '/dev/sdc1',
    fstype  => 'ext4',
    target  => '/etc/fstab',
    require => File['/var/test'],
  }
}
