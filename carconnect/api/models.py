from django.db import models
from django.core.validators import RegexValidator
from phonenumber_field.modelfields import PhoneNumberField
from django.core.exceptions import ValidationError
# Create your models here.

no_special_chars_validator = RegexValidator(
    regex=r'^[^\s@#$%]+$',
    message='Special characters like @, #, $, % are not allowed.'
)

def validate_username(value):
    invalid_characters = ["_", ".", ",", "&", "-", " ", "@", "#", "$", "%", "^"]
    for char in invalid_characters:
        if char in value:
            raise ValidationError(f"Username cannot include '{char}'.")

class User(models.Model):
    MALE = 'M'
    FEMALE = 'F'
    GENDER_CHOICES = [
        (MALE, 'Male'),
        (FEMALE, 'Female')
    ]
    uid = models.BigAutoField(primary_key=True)
    username = models.CharField(max_length=20, unique=True, validators=[validate_username])
    name = models.CharField(max_length=25)
    contact_number = PhoneNumberField(null=False, blank=False, unique=True)
    email = models.EmailField(null=False, blank=False, unique=True)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    presenet_loc_longitude = models.FloatField(blank=False, null=False)
    presenet_loc_latitude = models.FloatField(blank=False, null=False)
    
    def __str__(self):
        return self.username
    
class ServiceRequest(models.Model):
    requestId = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=None)
    presenet_loc_longitude = models.FloatField(blank=False, null=False)
    presenet_loc_latitude = models.FloatField(blank=False, null=False)
    destination_loc_longitude = models.FloatField(blank=False, null=False)
    destination_loc_latitude = models.FloatField(blank=False, null=False)
    isDeleted = models.BooleanField(default=False)

    def __str__(self):
        return f"Request {self.requestId} from {self.user.username}"