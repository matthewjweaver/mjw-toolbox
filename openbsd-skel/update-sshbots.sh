#!/bin/sh
# TODO: fix all these to support weird usernames and ipv6
< /var/log/authlog \
  grep 'sshd.*Invalid user'|sed -es'%^.* from%%g' -es'% port.*$%%g' |\
  xargs doas pfctl -t sshbots -T add
doas zcat /var/log/authlog.* | \
  grep 'sshd.*Invalid user'|sed -es'%^.* from%%g' -es'% port.*$%%g' |\
  xargs doas pfctl -t sshbots -T add
< /var/log/authlog \
  awk '/Disconnected from invalid user/ {print $11}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
doas zcat /var/log/authlog.* | \
  awk '/Disconnected from invalid user/ {print $11}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
< /var/log/authlog \
  awk '/Disconnected from authenticating user/ {print $11}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
doas zcat /var/log/authlog.* | \
  awk '/Disconnected from authenticating user/ {print $11}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
< /var/log/authlog \
  awk '/Unable to negotiate/ {print $10}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
doas zcat /var/log/authlog.* | \
  awk '/Unable to negotiate/ {print $10}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
doas pfctl -t sshbots -T delete -f sshbot-exclusions
doas pfctl -t sshbots -T show > /tmp/t && \
  doas mv /tmp/t /etc/pf.sshbots
