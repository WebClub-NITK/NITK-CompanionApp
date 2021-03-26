from djongo import models
from django import forms



class MenuItem(models.Model):
    item = models.CharField(max_length=300, default='', blank=True)

    class Meta:
        abstract = True

    def __str__(self) -> str:
        return self.item


class MenuItemForm(forms.ModelForm):
    class Meta:
        model = MenuItem
        fields = ('item',)

# Create your models here.


class Mess(models.Model):
    name = models.CharField(max_length=100)

    sunday = models.ArrayField(
        model_container=MenuItem, model_form_class=MenuItemForm)
    monday = models.ArrayField(
        model_container=MenuItem, model_form_class=MenuItemForm)
    tuesday = models.ArrayField(
        model_container=MenuItem, model_form_class=MenuItemForm)
    wednesday = models.ArrayField(
        model_container=MenuItem, model_form_class=MenuItemForm)
    thursday = models.ArrayField(
        model_container=MenuItem, model_form_class=MenuItemForm)
    friday = models.ArrayField(
        model_container=MenuItem, model_form_class=MenuItemForm)
    saturday = models.ArrayField(
        model_container=MenuItem, model_form_class=MenuItemForm)
    objects = models.DjongoManager()

    def __str__(self) -> str:
        return self.name

