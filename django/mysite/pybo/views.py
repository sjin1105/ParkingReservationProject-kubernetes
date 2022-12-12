from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from .models import Park
from django.utils import timezone
from django.http import HttpResponseNotAllowed
from .forms import ParkForm
from django.contrib.auth.decorators import login_required
from datetime import datetime
from django.contrib import messages

# 메인 페이지
def index(request):
    parks = Park.objects.using("slave")
    context = { 'parks': parks, 'error' : '' }
    return render(request, 'pybo/main_page.html', context )

def detail(request, park_id):
    pi = Park.objects.get(id=park_id)
    context = { 'pi' :  pi, 'error' : '' }
    return render(request, 'pybo/reserv_form.html', context)


# 예약하기
@login_required(login_url='common:login')
def reservation(request, park_id):
    pkid = get_object_or_404(Park, pk=park_id)

    if request.method == "POST":
        
        form = ParkForm(request.POST, instance=pkid)
        if form.is_valid():
            form.PARKID = request.POST['PARKID']
            form.PARKSEAT = request.POST['PARKSEAT']
            form.CARNUM = request.POST['CARNUM']
            form.DATE = request.POST['DATE']
            diff = get_object_or_404(Park, pk=park_id)
            check = list(Park.objects.filter(CARNUM=request.POST['CARNUM']))
            if diff.DATE == '3000-01-01' and not check:
                form.save()
            elif check:
                print('error')
                parks = Park.objects
                context = { 'error' : '사용중인 자리가 있습니다.', 'parks': parks }
                return render(request, 'pybo/main_page.html', context)
            else:
                print('error')
                parks = Park.objects
                context = { 'error' : '해당 자리는 이미 예약되었습니다.', 'parks': parks }
                return render(request, 'pybo/main_page.html', context)
        else:
            print('error')
            parks = Park.objects
            context = { 'error' : '올바른 정보가 아닙니다.', 'parks': parks }
            return render(request, 'pybo/main_page.html', context)
        
        parks = Park.objects
        context = { 'error' : 'True.', 'parks': parks }
        return render(request, 'pybo/main_page.html', context)
    else:
        form = ParkForm()
        context = {'form' : form}
        return render(request, 'pybo/reserv_form.html', context)
