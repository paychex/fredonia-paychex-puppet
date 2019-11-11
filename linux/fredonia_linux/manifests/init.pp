class fredonia_linux {

#Specifying subclasses: 

#Class for cron tasks
class { 'fredonia_linux::cron': }

#Class for user configs
class { 'fredonia_linux::users': }

#Class for services 
class { 'fredonia_linux::services': }

#Class for disk configuration
class { 'fredonia_linux::diskconfig': }

#Class for laying down/executing script
class { 'fredonia_linux::scriptexecute': }

}

