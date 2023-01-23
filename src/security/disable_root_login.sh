sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
/etc/init.d/sshd restart