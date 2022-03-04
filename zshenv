typeset -gx -U path
path=( \
    /usr/local/bin(N-/) \
    /opt/local/bin(N-/) \
    ~/bin(N-/) \
    "$path[@]" \
)
