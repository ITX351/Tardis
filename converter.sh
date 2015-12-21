function tabconverter() {
  for file in $1/*
  do
    if [ -d "$file" ]
    then
      tabconverter $file
    else
      tmp="${file##*/}"
      if [ "${tmp#*.}" = "html" ] # || "${file#*.}" = "erb" || "${file#*.}" = "html.erb"
      then
        sed -i 's/\t/  /g' $file
        echo Fixed $file
      fi
    fi
  done
}

tabconverter .
