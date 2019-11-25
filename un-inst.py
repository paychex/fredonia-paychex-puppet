import sys,subprocess


services = ['apache2','ntp','ssh','cron','smbd','iptables']

if sys.platform.startswith("linux"):
    # linux
    for s in services:
        # stop service if running
        program_status(services)
        command = ("sudo service " + s + " stop").split()
        proc = subprocess.run(command)



elif sys.platform.startswith("win32"):
    # windows
    for s in services:
        # stop service if running
        command = ("Stop-Service -Name " + s).split()
        proc = subprocess.run(command)



def program_status(service_array):
    [subprocess.run(("sudo service " + s + " status").split()) for s in service_array]