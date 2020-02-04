declare -A SHA_LIST

random_color() {  
  COLOR="\e[3$(( $RANDOM * 6 / 32767 + 1 ))m" 
  while [[ " ${SHA_LIST[@]} " =~ " ${COLOR} " ]] && [ ${#SHA_LIST[@]} -lt 7 ]; do     
    COLOR="\e[3$(( $RANDOM * 6 / 32767 + 1 ))m" 
  done
}

color() {  
  COLOR="${COLOR_NONE}"
  if [ ${#SHA_LIST[@]} -gt 0 ]; then
    if [ ${SHA_LIST[$1]} ]; then
      COLOR=${SHA_LIST[$1]} 
    else
      random_color
    fi
  fi
  SHA_LIST[$1]=$COLOR
}

COLOR="";
color a
echo -e ${COLOR}abc$COLOR_NONE
