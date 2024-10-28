#!/bin/sh

mkdir -p /services/autoshutdown-no-ssh
cp autoshutdown_no_ssh.sh /services/autoshutdown-no-ssh
cp autoshutdown-no-ssh.service /etc/systemd/system/
systemctl daemon-reload
systemctl start autoshutdown-no-ssh.service
systemctl enable autoshutdown-no-ssh.service
