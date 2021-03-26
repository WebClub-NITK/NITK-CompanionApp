from events.serializers import EventSerializer, LocationSerializer
from rest_framework import viewsets
from events.models import Event, Location

class EventViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows events to be viewed
    """
    queryset=Event.objects.all().order_by('-date_time')
    serializer_class=EventSerializer

class LocationViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows locations to be viewed
    """
    queryset=Location.objects.all()
    serializer_class=LocationSerializer