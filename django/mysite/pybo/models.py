from unittest.util import _MAX_LENGTH
from django.db import models

# Create your models here.

class Park(models.Model):
    PARKID = models.CharField(max_length=100)
    PARKSEAT = models.CharField(max_length=100)
    CARNUM = models.CharField(max_length=100)
    DATE = models.CharField(default='YYYY-MM-DD', max_length=10)
    # YYYY-MM-DD

    
