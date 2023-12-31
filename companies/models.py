from django.db import models

from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser

# Create your models here.

# custom custom user manager model
class CustomCompanyManager(BaseUserManager):
    def create_user(self, company_email, company_name, password=None, password2=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not company_email:
            raise ValueError("Users must have an email address")

        user = self.model(
            company_email=self.normalize_email(company_email),
            company_name=company_name,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, company_email, company_name, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            company_email,
            password=password,
            company_name=company_name,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


# custom user model
class Company(AbstractBaseUser):
    company_email = models.EmailField(
        verbose_name="Company Email",
        max_length=255,
        unique=True,
    )
    company_name = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = CustomCompanyManager()

    USERNAME_FIELD = "company_email"
    REQUIRED_FIELDS = ["company_name"]

    def __str__(self):
        return self.company_email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return self.is_admin

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin
