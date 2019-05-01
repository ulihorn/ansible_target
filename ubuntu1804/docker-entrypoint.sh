#!/usr/bin/env bash
set -eo pipefail

# enable rsyslog daemon so that SSHD log file is created
#rsyslogd

# start SSH daemon
mkdir /var/run/sshd
chmod 0755 /var/run/sshd
/usr/sbin/sshd -D
