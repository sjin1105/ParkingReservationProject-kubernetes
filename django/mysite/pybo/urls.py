4
from django.urls import path
from . import views

app_name = 'pybo'

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:park_id>', views.detail, name='detail'),
    path('reserv/<int:park_id>', views.reservation, name='reservation'),
]
