#!/usr/bin/env bash
# Service Status monitor.
# Verify that the service is running.
# It requires a parameter: service name. For example, sshd.
# [service]
# service_status.param = sshd
# You can monitor multiple services:
#
# [service]
# service_status(sshd).param = sshd
# service_status(nginx).param = nginx
#
# Add the configuration to:
# /etc/simple-monitor-alert/sma.ini

echo "service_status.name = 'Service (daemon) status'."
echo "service_status.expected = 'active'"
echo "service_status.require_param = yes"
echo "service_status.value = '"`systemctl status $service_status | head -n 3 | tail -n 1 | awk '{print $2}'`"'"
