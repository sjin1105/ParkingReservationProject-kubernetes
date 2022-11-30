from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class UserForm(UserCreationForm):
    first_name = forms.CharField(label="차 넘버")
    class Meta:
        model = User
        fields = ("username", "password1", "password2", "first_name")