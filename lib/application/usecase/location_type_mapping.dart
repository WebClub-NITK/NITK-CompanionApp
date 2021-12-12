// LECTURE_HALL = 'LH'
// ADMINISTRATION_BUILDING = 'AB'
// HOSTEL_BLOCK = 'HB'
// AMENITY = 'AM'
// EATERY = 'EAT'
// SHOP = 'SH'
// MISCELLANEOUS = 'MISC'
class LocationTypeMapping {
  String getLocationTypeFromAbbreviation(String abbreviation) {
    switch (abbreviation) {
      case "LH":
        return "Lecture Hall";
        break;
      case "AB":
        return "Administration Building";
        break;
      case "HB":
        return "Hostel Block";
        break;
      case "AM":
        return "Amenity";
        break;
      case "EAT":
        return "Eatery";
        break;
      case "SH":
        return "Shop";
        break;
      case "MISC":
        return "Miscellaneous";
        break;
    }
    return "";
  }
}
