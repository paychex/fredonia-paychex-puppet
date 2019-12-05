#! /bin/bash
######### Variables #########
declare -a services
services=(cron ssh ntp samba apache2 ufw)

######## Function(s) ########
# pause execution of program until any key
# is pressed
function pause() {
  read -n 1 -r -s
}

# show state of targeted system services,
# resources, etc.
function show_changes() {
  for s in ${services[@]}; do
    if [ $s = 'cron' ]; then
      sudo service cron stop
    fi
    sudo service $s status
    pause
    echo ''
  done
  pause
  clear

  echo -e "Date Script\n"
  ls /var/test
  sudo cat /var/test/date.txt
  pause
  clear

  # show disk mount status
  sudo df -h
  pause
  clear

  # show user present and home directory
  id guest
  ls /home
  pause
  clear

  # show minecraft status
#  sudo service minecraft status
#  pause
#  clear
}

#############################
########### START ###########

# apply initial configuration
sudo puppet apply /opt/puppetlabs/puppet/modules/fredonia_linux/init.pp
pause
clear

# show status
show_changes

#-------- muck things up ---------#
# remove date file
sudo rm /var/test/date.txt
ls /var/test
pause
clear

# unmount disk
sudo umount /dev/sdb1
sudo df -h
pause
clear

# change user
sudo deluser guest
sudo rm -R /home/guest
echo ''
id guest
ls /home
pause
clear

# stop/start services
for s in ${services[@]}; do
  if [ $s = 'ufw' ] || [ $s = 'cron' ]; then
    sudo service $s start
    sudo service $s status
  else
    sudo service $s stop
    sudo service $s status
  fi
  pause
  echo ''
done
pause
clear

echo -e 'Waiting for puppet to update ...\n'
pause
clear

# wait for cronjob then,
show_changes

######### END ##########
########################
