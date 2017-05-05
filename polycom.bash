#!/usr/bin/expect -f
#expect script to supply admin password for remote telnet server and execute commands
#The script doesn't need any arguments

#set username
set user "admin"

#set password
set password "avErs6835:calve"

#set timeout
set timeout -1

#run telnet
spawn telnet 10.50.240.5

#buffer size
match_max 100000

#look for username
expect "Username:"
send -- "$user\r"

#Look for password prompt
expect "Password:"
send -- "$password\r"

#look for core01 and enter commandline
expect "<core01>"
send -- "_cmdline-mode on\r"

sleep 1
#look for confirmation
#expect "All commands can be displayed and executed. Continue? [Y/N]"
send -- "Y\r"

#Enter password for commandline
expect "Please input password:"
send -- "Jinhua1920unauthorized\r"

#Enter super mode
expect {<core01>}
send -- "super\r"

#enter system-view
expect {<core01>}
send -- "system-view\r"

#expect mode change and enter interface connected to polycom
expect {[core01]}
#sleep 1
send -- "interface GigabitEthernet 1/0/9\r"

#once in interface, disable poe
expect {[core01-GigabitEthernet1/0/9]}
#sleep 1
send -- "undo poe enable\r"

#wait for 2 seconds
sleep 2

#enable poe
send -- "poe enable\r"

#exit from interface configs
send -- "return\r"

#exit telnet session
expect "<core01>"
send -- "quit\r"
