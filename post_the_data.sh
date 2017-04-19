#!/bin/bash

DATE=` date +%d -d "1 day ago"`
www_haodf=/home/avatar/wsp/Baiduspider/$DATE/Baiduspider.varnish-35-common.idc1.xxxxx.net.html
#m_haodf=/home/avatar/wsp/Baiduspider/06/Baiduspider.varnish-37-common.idc1.xxxxx.net.html
others_haodf=/home/avatar/wsp/Baiduspider/$DATE/Baiduspider.varnish-38-common.idc1.xxxxx.net.html

www_log=/home/avatar/wsp/Baiduspider/www/www-l-ng3.ops.prod.idc1.`date +"%Y%m%d" -d "1 day ago"`.log

#m_log=/tmp/m_xxxxx.com20.log
m_log=/home/avatar/wsp/Baiduspider/m-`date -d "1 day ago" +%F`-final.log
others_log=/tmp/others_xxxxx.com20.log

if [ ! -f ${m_log} ]
then
        echo "m log not  exist" | mail -s "varify m log exists"  libin@xxxxx.com,554624371@qq.com
	m_log=/home/avatar/wsp/Baiduspider/m_backup.log
fi

if [ ! -f ${www_log} ]
then
        echo "www log not  exist" | mail -s "varify www log exists"  libin@xxxxx.com,554624371@qq.com
	www_log=/home/avatar/wsp/Baiduspider/www_backup.log
fi

new_www_log=/home/avatar/wsp/Baiduspider/www_final.log

grep -v "index.htm"  $www_log | grep -v "404.html" > $new_www_log

# Baiduspider.varnish-35-common.html  对应的是 www.xxxxx.com 百度蜘蛛抓取情况分析报表top20
#grep "<td" $www_haodf  | awk -F'>' '{print $2}' | grep 'www' | awk -F'<' '{print $1}'| awk -F'/' '{print $NF}' > $www_log

# Baiduspider.varnish-37-common.html  对应的是 m.xxxxx.com:百度蜘蛛抓取情况分析报表 top20
#grep "<td" $m_haodf |  awk -F'>' '{print $2}'  | grep 'm\.' | awk -F'<' '{print $1}' | awk -F'/' '{print $NF}'  > $m_log
# Baiduspider.varnish-38-common.html  对应的是 *.xxxxx.com:百度蜘蛛抓取情况分析报表 top20
#grep "<td" $others_haodf  | awk -F'>' '{print $2}' | grep "[a-z0-9]*\.[a-z0-9]*\.com" | awk -F'<' '{print $1}' | awk -F'/' '{print $NF}' > $others_log
grep "<td" $others_haodf | awk -F'>' '{print $2}' |  grep -v "api.xxxxx.com/openplatform" |grep -v "360.platform.xxxxx.com/touch" | grep -v "m.xxxxx.com" | grep "[a-z0-9]*\.[a-z0-9]*\.com"  | awk -F '<' '{print $1}' | sed -e "s@ @@g" > $others_log

#declare -a www_arr=($(cat $www_log))
#declare -a m_arr=($(cat $m_log))
#declare -a other_arr=($(cat $others_log))

www_list=`cat $new_www_log |xargs echo|sed -e 's# #","#g' -e 's#^#["#g' -e 's#$#"]#g'`
m_list=`cat $m_log |xargs echo|sed -e 's# #","#g' -e 's#^#["#g' -e 's#$#"]#g'`
others_list=`cat $others_log |xargs echo|sed -e 's# #","#g' -e 's#^#["#g' -e 's#$#"]#g'`
	
#echo $others_list
result_dir="/home/avatar/seo_result"

curl -s -g -d "" "http://mon.xxxxx.net/mon-api/seo-top-twenty?domain_name=www.xxxxx.com&domain_url_top_ten=$www_list" > $result_dir/www_xxxxx.com-`date +%F`.txt

result_code=$(grep "status" $result_dir/www_xxxxx.com-`date +%F`.txt | awk -F':' '{print $2}' |  sed 's# ##g')
if [  ${result_code}  -ne  200 ]
then
	echo "`date +%F-%T` status is  ${result_code}" >> $result_dir/www_xxxxx.com_error.txt
fi



curl -s -g -d "" "http://mon.xxxxx.net/mon-api/seo-top-twenty?domain_name=m.xxxxx.com&domain_url_top_ten=$m_list" > $result_dir/m_xxxxx.com-`date +%F`.txt

mresult_code=$(grep "status" $result_dir/m_xxxxx.com-`date +%F`.txt | awk -F':' '{print $2}' |  sed 's# ##g')
if [  ${mresult_code}  -ne  200 ]
then
	echo "`date +%F-%T` status is  ${mresult_code}" >> $result_dir/m_xxxxx.com_error.txt
fi


curl -s -g -d "" "http://mon.xxxxx.net/mon-api/seo-top-twenty?domain_name=*.xxxxx.com&domain_url_top_ten=$others_list" > $result_dir/others_xxxxx.com-`date +%F`.txt

oresult_code=$(grep "status" $result_dir/others_xxxxx.com-`date +%F`.txt | awk -F':' '{print $2}' |  sed 's# ##g') 
if [  ${oresult_code}  -ne  200 ]
then
	echo "`date +%F-%T` status is  ${oresult_code}" >> $result_dir/others_xxxxx.com_error.txt
fi

echo $www_list > /home/avatar/www_respon
