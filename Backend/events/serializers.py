from events.models import Location, Event
from rest_framework import serializers


class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ['pk', 'name', 'latitude', 'longitude', 'description', 'location_type']


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ['pk', 'name', 'description', 'location', 'date_time', 'photo_url']