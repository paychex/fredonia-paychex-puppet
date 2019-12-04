class fredonia_windows::users () {
  user { 'guest':
    ensure  => 'present',
    comment => 'guest account',
    groups  => 'guests',
  }
  user { 'administrator':
    ensure  => 'present',
    comment => 'administrator account',
    groups  => 'administrators',
  }
}
