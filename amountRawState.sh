#date="2022-07-09 2022-07-10"

echo "please input date range?"
# input args
read -p "month? " month
read -p "firstday? " firstday
read -p "lastday? " lastday


#for dd in ${date}
for dd in $(seq -s " " -f %02g $firstday $lastday);
do
  echo "${month}-${dd}"
  echo 'num of raw  data'
  #cat /var/log/bed_raw_data_rec.log |grep -a "${month}-$dd" |grep -a mqtt_transport_raw_data |grep -v u21 |grep -v send_sample |grep -a 8CAAB5A130A0 |grep -v status |wc -l
  cat /var/log/bed_raw_data_rec.log |grep -a "${month}-$dd" |grep -v mqtt_transport_raw_data |grep -v u21 |grep -v send_sample |grep -a 8CAAB5A130A0 |grep -v status |wc -l
  echo '    '
  echo 'num of bedstates'
  #cat /var/log/bed_raw_data_rec.log |grep -a "${month}-$dd" |grep -a mqtt_transport_raw_data |grep -a status |wc -l
  cat /var/log/bed_raw_data_rec.log |grep -a "${month}-$dd" |grep -v mqtt_transport_raw_data |grep -a status |wc -l
  echo '-----------------'
done
