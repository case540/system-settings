import datetime

first_day = datetime.date(2016, 10, 9)
last_dat = datetime.date(2016, 10, 15)
time_delta = datetime.timedelta(weeks=1)
OUTPUT_FORMAT = '%m/%d/%Y'
for i in range(63, 3678, 1):
  print('week %d: %s-%s' %
    (i, first_day.strftime(OUTPUT_FORMAT), last_dat.strftime(OUTPUT_FORMAT)))
  first_day += time_delta
  last_dat += time_delta


