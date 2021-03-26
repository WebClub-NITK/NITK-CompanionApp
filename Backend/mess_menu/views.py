from mess_menu.serializers import MessSerializer
from rest_framework import viewsets
from mess_menu.models import Mess

class MessViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows mess menus to be viewed
    """
    queryset=Mess.objects.all()
    serializer_class=MessSerializer