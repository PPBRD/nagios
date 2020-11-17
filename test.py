#!/usr/bin/env python

from pprint import pprint
from jnpr.junos import Device
from jnpr.junos.utils.start_shell import StartShell

dev = Device(host='XX.xx.xx.xx', user='xxxxx', password='xxxxxx@9')

ss = StartShell(dev)
ss.open()
version = ss.run('cli -c "show pppoe sessions | no-more"')
print (version)
ss.close()
