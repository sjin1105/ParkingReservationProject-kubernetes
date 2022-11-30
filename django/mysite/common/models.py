from django.db import models
from django.contrib.auth.models import User

User._meta.get_field('first_name')._unique = True

# Create your models here.
