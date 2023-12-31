# Generated by Django 4.2.1 on 2023-06-22 08:39

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ("employee", "0002_remove_employee_contact_info_employee_emp_email"),
    ]

    operations = [
        migrations.AlterField(
            model_name="employee",
            name="company",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE,
                related_name="company",
                to=settings.AUTH_USER_MODEL,
            ),
        ),
    ]
