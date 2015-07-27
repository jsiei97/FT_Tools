#!/bin/bash

# Generate sv_SE.UTF-8 and en_GB.UTF-8
sudo sed -i 's/\# \(sv_SE.UTF-8\)/\1/g' /etc/locale.gen
sudo sed -i 's/\# \(en_GB.UTF-8\)/\1/g' /etc/locale.gen
sudo locale-gen

# On other systems it seems be a arg?
#sudo locale-gen sv_SE.UTF-8
#sudo locale-gen en_GB.UTF-8

# Adds LC and other misc things
cat >> ~/.profile << EOF

# Added by FT_Tool
export LC_TIME="sv_SE.utf8"
export LC_PAPER="sv_SE.utf8"
export LC_MEASUREMENT="sv_SE.utf8"
export LC_NUMERIC="en_GB.utf8"
export LC_MONETARY="sv_SE.utf8"

EOF


cat >> ~/.bashrc << EOF

# Added by FT_Tool
# the ~/ tab-problem
_expand()
{
    return 0;
}

# To save core dumps enable this
#ulimit -c unlimited

#another date with: week.day
alias date_semc='date +"w%V.%u"'
alias date_iso='date +"%Y-%m-%d %H:%M"'

alias cal='cal -m'

shopt -s histverify

EOF
