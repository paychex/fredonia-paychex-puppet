class fredonia_windows::schedtask () {
  #powershell script that command runs in windows server:
  #  $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'puppet apply [filepath]/init.pp'
  #  $trigger = New-ScheduledTaskTrigger -Daily -RepetitionInterval 00:30:00
  #  Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "schedtask"

  exec { 'schedtask':
    command => 'C:\windows\System32\WindowsPowerShell\v1.0\PowerShell.exe C:Users\pkelley\schedtask.ps1',
  }
}
