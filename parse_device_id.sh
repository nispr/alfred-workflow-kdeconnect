
  sanitize_device_entry() {
    prefix="- "
    string=$1
    result=${string#"$prefix"}
    echo -n $(echo ${result} | tr -d '\n' | tr -d '\r')
    return 0
  }

  get_regex_capturing_group() {
    result=0
    matcher=$2
    groupIndex=$3
    input=$1
    if [[ $input =~ $matcher ]]
    then
      group="${BASH_REMATCH[$groupIndex]}"
    else
      >&2 echo "Error getting capturing group $groupIndex: no match for $matcher in string '$input'"
      group=''
      result=1
    fi
    echo -n $group
    return $result
  }

  parse_device_id() {
    deviceIdMatch="^(.+: )([^ ]+)"
    result=$(get_regex_capturing_group "$1" "$deviceIdMatch" "2")
    echo -n $(echo -n ${result} | tr -d '\n\r')
    return $?
  }

  parse_device_name() {
    deviceIdMatch="^(.+: )([^ ]+)"
    suffix=" "
    suffix2=":"
    result=$(get_regex_capturing_group "$1" "$deviceIdMatch" "1")
    result=${result%"$suffix"}
    result=${result%"$suffix2"}
    echo -n $(echo -n "${result:0:${#result} - 1}" | tr -d '\n\r')
    return $?
  }