#!/bin/sh

rm -rf /services/autoshutdown-no-ssh
systemctl disable autoshutdown-no-ssh.service
systemctl stop autoshutdown-no-ssh.service
rm -rf /etc/systemd/system/autoshutdown-no-ssh.service
systemctl daemon-reload
