from datetime import datetime

# create timestamp, human readable
timestamp = datetime.now().isoformat(timespec='minutes') + '\n'

# open date.txt and append current time to file
with open('/var/test/date.txt', 'a') as f:
    f.write(timestamp)