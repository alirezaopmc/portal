cfg_path=/etc/ssh/sshd_config
res=$(cat $cfg_path | grep DenyUsers)

if [ -z $res || $res =~ "#DenyUsers".* ]; then
    echo 'DenyUsers j' >> $cfg_path
else if [[ $res =~ .*" j" || $res =~ .*" j ".*  ]]; then
    # Do nothing
else
    sed -i 's/DenyUsers/DenyUsers j/' $cfg_path
fi

