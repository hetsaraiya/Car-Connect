# Generated by Django 4.2.5 on 2024-04-22 16:46

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("api", "0003_alter_user_contact_number"),
    ]

    operations = [
        migrations.AddField(
            model_name="servicerequest",
            name="rider",
            field=models.OneToOneField(
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                related_name="rider",
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        migrations.AlterField(
            model_name="user",
            name="gender",
            field=models.CharField(
                choices=[("Male", "Male"), ("Female", "Female")], max_length=6
            ),
        ),
    ]