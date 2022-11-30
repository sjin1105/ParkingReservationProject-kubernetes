from django import forms
from pybo.models import Park

class ParkForm(forms.ModelForm):
    class Meta:
        model = Park
        fields = ['PARKID', 'PARKSEAT', 'CARNUM', 'DATE']
        labels = {
            'PARKID' : '주차장 이름',
            'PARKSEAT' : '주차장 자리',
            'CARNUM' : '차량 번호',
            'DATE' : '예약일'
        }
