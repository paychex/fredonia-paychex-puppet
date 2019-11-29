class fredonia_linux::cron () {
  cron { 'Execute puppet every 5 minutes':
    command => '/opt/puppetlabs/bin/puppet apply --modulepath=/opt/fredonia_linux /opt/fredonia_linux/manifests/init.pp',
    user    => root,
    hour    => '*',
    minute  => '*/5',
  }
}
