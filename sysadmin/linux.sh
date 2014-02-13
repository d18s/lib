#-------------------------------------------------------------------------------
# USEFUL ONE-LINERS FOR LINUX SYSADIM

# stop a (upstart) service
sudo stop SERVICE

# stop serivce from starting on reboot
sudo sh -c 'echo "manual" > /etc/init/SERVICE.override'

# run command at start up
sudo sh -c 'echo "COMMAND" >> /etc/rc.local'

# find python packages used
find . -name "*py"|xargs grep -oEh '^ *(import.*|from.*import)'|tr ',' ' '|tr ' ' '\n'|grep -vE "^(from|import|$|#|=)"|grep -o "^[^.]*"|sort|uniq -c|sort -n

# find python standard packages
find /usr/lib/python2.7/ -name "*.py"|grep -o [^/]*.py$|grep -o ^[^.]*|sort|uniq
