#!/bin/bash

# Adds LC and other misc things

cat >> ~/.profile << EOF

# Added by FT_Tool
export LC_TIME="sv_SE.utf8"
export LC_PAPER="sv_SE.utf8"
export LC_MEASUREMENT="sv_SE.utf8"
export LC_NUMERIC="sv_SE.utf8"
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
