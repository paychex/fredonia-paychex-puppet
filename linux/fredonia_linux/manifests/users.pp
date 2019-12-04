#add a user to the system
#class fredonia_linux::users (String $user_name = '',
#  String $user_uid = '') {
#  #generic user
#  unless $user_name == '' {
#    user { $user_name :
#      ensure     => present,
#      managehome => true,
#      group      => $user_uid,
#      #password   => password_here,
#      #ssh_key    => key_here,
#    }
#  }
#}

class fredonia_linux::users { 
  user { 'guest':
    ensure     => 'present',
    managehome => true,
    uid        => '2000'
    #password  => '',
    #ssh_key   => '',
  }
}
