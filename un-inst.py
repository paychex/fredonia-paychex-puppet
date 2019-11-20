import sys,subprocess

services = sys.argv[1:]

if sys.platform.startswith("linux"):
    # linux
    for s in services:
        # stop service if running
        command = ("sudo service " + s + " stop").split()
        proc = subprocess.run(command)

elif sys.platform.startswith("win32"):
    # windows
    for s in services:
        # stop service if running
        command = ("Stop-Service -Name " + s).split()
        proc = subprocess.run(command)