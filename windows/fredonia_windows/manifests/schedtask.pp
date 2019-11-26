class fredonia_windows::schedtask () {
  #This assumes that the module/init files reside in C:\Program Files\Puppet Labs
  scheduled_task { 'Run puppet every 30 mn':
    ensure    => 'present',
    command     => "C:/Windows/system32/WindowsPowerShell/v1.0/powershell.exe",
    arguments   => '-NoLogo -NonInteractive -ExecutionPolicy Bypass -Command & "C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat" apply --modulepath="C:\Program Files\Puppet Labs" "C:\Program Files\Puppet Labs\init.pp"',
    enabled   => 'true',
    trigger   => [{
      'schedule'         => 'daily',
      'start_time'       => '00:00',
      'minutes_interval' => '30' 
    }],
  }
}
