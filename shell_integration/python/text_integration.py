import os
import time
from datetime import datetime


def print_detail(msg, msg_type,delay):
    current_datetime = str(datetime.now())
    print(f'{current_datetime} [ {msg_type} ] {msg}')
    time.sleep(delay)

def call_detail():
    print_detail("Starting 4D-vector CLI v1.0 2023....","workflow",1)
    os.system('cat /home/starvader/hashhacks/shell_integration/python/text_integrate.txt')

call_detail()