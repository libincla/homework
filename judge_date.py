#!/Users/libin/my_flask_2/bin/python
#coding:utf-8

from datetime import datetime,timedelta

a_week = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']


#dayname 传的是周几
def get_day(dayname,start_date=None):
        if start_date is None:
                start_date = datetime.today()
        # 这里很诡异，周一是0，周日是6....
        day_num = start_date.weekday()
        day_num_target = a_week.index(dayname)
        day_ago = ( 7 + day_num - day_num_target) % 7

        if day_ago == 0:
                day_ago = 7
        target_date = start_date - timedelta(days=day_ago)

        return target_date


print(get_day('Monday'))
print(get_day('Tuesday'))
print(get_day('Wednesday'))
print(get_day('Friday'))
