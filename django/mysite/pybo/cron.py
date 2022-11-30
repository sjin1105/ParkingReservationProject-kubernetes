from datetime import datetime
from .models import Park


def delete_reserv():
    now = datetime.now()
    Date = now.strftime("%Y-%m-%d")
    delete_quary = Park.objects.all().exclude(DATE='3000-01-01')

    for date in delete_quary:
        print(date.CARNUM, "예약자", date.DATE, "까지", date.PARKID, date.PARKSEAT, "예약중")
        if date.DATE < Date:
            date.DATE = '3000-01-01'
            date.CARNUM = 'N'
            date.save()
        
# python3 manage.py crontab add
# python3 manage.py crontab show
# python3 manage.py crontab remove