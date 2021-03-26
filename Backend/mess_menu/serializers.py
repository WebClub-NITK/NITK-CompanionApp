from mess_menu.models import Mess
from rest_framework import serializers


class MessSerializer(serializers.ModelSerializer):
    menu = serializers.SerializerMethodField()

    class Meta:
        model = Mess
        fields = ['pk','name', 'menu']

    def get_menu(self, obj):
        return_data = {}

        mess_data=obj.__dict__

        days_of_week=['sunday', 'monday', 'tuesday','wednesday', 'thursday', 'friday', 'saturday']

        for day in days_of_week:
            return_data[day]=[]
            for item in mess_data[day]:
                menu_item=item.__dict__
                return_data[day].append(menu_item['item'])

        return return_data
