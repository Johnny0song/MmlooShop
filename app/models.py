from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=300)
    phone = models.CharField(max_length=50)
    token = models.CharField(max_length=300)

    def __str__(self):
        return self.username

