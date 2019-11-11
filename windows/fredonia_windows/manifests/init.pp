class fredonia_windows {

#Specifying subclasses:

#Class for scheduled tasks
class { 'fredonia_windows::schedtask': }

#Class for user configs
class { 'fredonia_windows::users': }

#Class for services
class { 'fredonia_windows::services': }

#Class for disk configuration
class { 'fredonia_windows::diskconfig': }

#Class for laying down/executing script
class { 'fredonia_windows::scriptexecute': }

#Class for laying down minecraft server "application"
class { 'fredonia_windows::minecraft': }

}
