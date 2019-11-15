#add a user to the system
class fredonia_linux::users (String $user_name = 'guest') {
  #generic user
  unless $user_name == '' {
    user { $user_name :
      ensure     => present,
      managehome => true,
      password   => password_here,
      ssh_key    => key_here,
    }
  }
}
