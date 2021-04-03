from djongo import models


class Location(models.Model):
    LECTURE_HALL = 'LH'
    ADMINISTRATION_BUILDING = 'AB'
    HOSTEL_BLOCK = 'HB'
    AMENITY = 'AM'
    EATERY = 'EAT'
    SHOP = 'SH'
    MISCELLANEOUS = 'MISC'

    LOCATION_TYPE_CHOICES = [
        (LECTURE_HALL, 'Lecture Hall'),
        (ADMINISTRATION_BUILDING, 'Administration Building'),
        (HOSTEL_BLOCK, 'Hostel Block'),
        (AMENITY, 'Amenity'),
        (EATERY, 'Eatery'),
        (SHOP, 'Shop'),
        (MISCELLANEOUS, 'Miscellaneous')
    ]

    name = models.CharField(max_length=100, default='')
    latitude = models.DecimalField(
        blank=False, default=0.0, decimal_places=6, max_digits=9)
    longitude = models.DecimalField(
        blank=False, default=0.0, decimal_places=6, max_digits=9)
    description = models.TextField(default='')
    location_type = models.CharField(
        max_length=4, choices=LOCATION_TYPE_CHOICES, default=MISCELLANEOUS)

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
