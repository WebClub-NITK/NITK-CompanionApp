from djongo import models


class Location(models.Model):
    name = models.CharField(max_length=100, default='')
    latitude = models.DecimalField(
        blank=False, default=0.0, decimal_places=6, max_digits=9)
    longitude = models.DecimalField(
        blank=False, default=0.0, decimal_places=6, max_digits=9)
    description = models.TextField(default='')

    def __str__(self) -> str:
        return self.name


class Event(models.Model):
    name = models.CharField(max_length=200, default='')
    description = models.TextField(default='')
    location = models.ForeignKey(
        'Location', blank=True, null=True, on_delete=models.SET_NULL)
    date_time = models.DateTimeField(auto_now=True)
    photo_url = models.URLField(max_length=3000, blank=True)

    def __str__(self) -> str:
        return self.name
