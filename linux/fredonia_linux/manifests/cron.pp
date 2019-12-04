class fredonia_linux::cron () {
  cron { 'Execute puppet every 5 minutes':
    command => '/opt/puppetlabs/bin/puppet apply /opt/puppetlabs/puppet/modules/fredonia_linux/init.pp',
    user    => root,
    hour    => '*',
    minute  => '*/5',
  }
}
