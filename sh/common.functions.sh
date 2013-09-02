#!/bin/sh

function green($string) {
    return "\033[1;32m{$string}\033[0m";
}

function red($string) {
    return "\033[1;31m{$string}\033[0m";
}

function generatePassword($length = 8, $chars = '#[]()-_!?%abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789') {
    return substr(str_shuffle($chars), 0, $length);
}

function _inihash () {
    # private function
    # call at the beginning of each procedure
    # defines: _keys _values _ptr
    #
    # Usage: _inihash NAME
    local name=$1
    _keys=_${name}_keys
    _values=_${name}_values
    _ptr=_${name}_ptr
}

function newhash () {
    # Usage: newhash NAME
    #        NAME should not contain spaces or dots.
    #        Actually: it must be a legal name for a Bash variable.
    # We rely on Bash automatically recognising arrays.
    local name=$1 
    local _keys _values _ptr
    _inihash ${name}
    eval ${_ptr}=0
}


function addhash () {
    # Usage: addhash NAME KEY 'VALUE with spaces'
    #        arguments with spaces need to be quoted with single quotes ''
    local name=$1 k="$2" v="$3" 
    local _keys _values _ptr
    _inihash ${name}

    #echo "DEBUG(addhash): ${_ptr}=${!_ptr}"

    eval let ${_ptr}=${_ptr}+1
    eval "$_keys[${!_ptr}]=\"${k}\""
    eval "$_values[${!_ptr}]=\"${v}\""
}

function gethash () {
    #  Usage: gethash NAME KEY
    #         Returns boing
    #         ERR=0 if entry found, 1 otherwise
    #  That's not a proper hash --
    #+ we simply linearly search through the keys.
    local name=$1 key="$2" 
    local _keys _values _ptr 
    local k v i found h
    _inihash ${name}
    
    # _ptr holds the highest index in the hash
    found=0

    for i in $(seq 1 ${!_ptr}); do
	h="\${${_keys}[${i}]}"  #  Safer to do it in two steps,
	eval k=${h}             #+ especially when quoting for spaces.
	if [ "${k}" = "${key}" ]; then found=1; break; fi
    done;

    [ ${found} = 0 ] && echo $key
    [ ${found} = 0 ] && return 1;
    # else: i is the index that matches the key
    h="\${${_values}[${i}]}"
    eval echo "${h}"
    return 0;	
}

function keyshash () {
    # Usage: keyshash NAME
    # Returns list of all keys defined for hash name.
    local name=$1 key="$2" 
    local _keys _values _ptr 
    local k i h
    _inihash ${name}
    
    # _ptr holds the highest index in the hash
    for i in $(seq 1 ${!_ptr}); do
	h="\${${_keys}[${i}]}"   #  Safer to do it in two steps,
	eval k=${h}              #+ especially when quoting for spaces.
	echo -n "'${k}' "
    done;
} 

