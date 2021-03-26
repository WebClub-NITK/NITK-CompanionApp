from datetime import datetime
from django.test import TestCase
from events.models import Location, Event


class EventTestCase(TestCase):
    def setUp(self):
        self.location = location = Location.objects.create(
            name="Main Building", latitude=13.010876, longitude=74.794327)
        self.event = Event.objects.create(
            name="Incident", description="Some desc", date_time=datetime.now(), location = location)
    
    def test_location_is_saved(self):
        self.assertEquals(self.event.location.name, self.location.name)

# Create your tests here.
