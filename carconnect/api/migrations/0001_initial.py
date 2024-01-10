# Generated by Django 4.2.5 on 2024-01-06 05:56

import api.models
import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="GenderChoices",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="User",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "username",
                    models.CharField(
                        max_length=18,
                        unique=True,
                        validators=[
                            django.core.validators.RegexValidator(
                                message="Special characters like @, #, $, % are not allowed.",
                                regex="^[^\\s@#$%]+$",
                            )
                        ],
                    ),
                ),
                ("name", models.CharField(max_length=25)),
                (
                    "contact_number",
                    api.models.PhoneNumberField(max_length=20, unique=True),
                ),
                (
                    "gender",
                    models.CharField(
                        choices=[("M", "Male"), ("F", "Female")], max_length=1
                    ),
                ),
                ("presenet_loc_longitude", models.FloatField()),
                ("presenet_loc_latitude", models.FloatField()),
                ("destination_loc_longitude", models.FloatField()),
                ("destination_loc_latitude", models.FloatField()),
            ],
        ),
    ]
