class fredonia_windows::users () {
  user { 'guest':
    ensure  => 'present',
    comment => 'guest account',
    group   => 'guest',
    #password => ,
    #ssh_key  => ,
  }
  user { 'administrator':
    ensure  => 'present',
    comment => 'administrator account',
    group   => 'administrator',
    #password => ,
    #ssh_key  => ,
  }
}
