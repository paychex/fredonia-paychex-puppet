class fredonia_windows::users () {
  user { 'guest':
    ensure  => 'present',
    comment => 'guest account',
    group   => 'guest',
  }
}
