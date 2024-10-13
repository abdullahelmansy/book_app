var governorates = [
  {"id": 1, "governorate_name_en": "Cairo"},
  {"id": 2, "governorate_name_en": "Giza"},
  {"id": 3, "governorate_name_en": "Alexandria"},
  {"id": 4, "governorate_name_en": "Dakahlia"},
  {"id": 5, "governorate_name_en": "Red Sea"},
  {"id": 6, "governorate_name_en": "Beheira"},
  {"id": 7, "governorate_name_en": "Fayoum"},
  {"id": 8, "governorate_name_en": "Gharbiya"},
  {"id": 9, "governorate_name_en": "Ismailia"},
  {"id": 10, "governorate_name_en": "Menofia"},
  {"id": 11, "governorate_name_en": "Minya"},
  {"id": 12, "governorate_name_en": "Qaliubiya"},
  {"id": 13, "governorate_name_en": "New Valley"},
  {"id": 14, "governorate_name_en": "Suez"},
  {"id": 15, "governorate_name_en": "Aswan"},
  {"id": 16, "governorate_name_en": "Assiut"},
  {"id": 17, "governorate_name_en": "Beni Suef"},
  {"id": 18, "governorate_name_en": "Port Said"},
  {"id": 19, "governorate_name_en": "Damietta"},
  {"id": 20, "governorate_name_en": "Sharkia"},
  {"id": 21, "governorate_name_en": "South Sinai"},
  {"id": 22, "governorate_name_en": "Kafr Al sheikh"},
  {"id": 23, "governorate_name_en": "Matrouh"},
  {"id": 24, "governorate_name_en": "Luxor"},
  {"id": 25, "governorate_name_en": "Qena"},
  {"id": 26, "governorate_name_en": "North Sinai"},
  {"id": 27, "governorate_name_en": "Sohag"}
];

class Governorates {
  final int id;
  final String name;

  Governorates({required this.id, required this.name});

  factory Governorates.fromJson(Map<String, dynamic> json) {
    return Governorates(
      id: json['id'],
      name: json['governorate_name_en'],
    );
  }
}

List<Governorates> getGovernorate() {
  return governorates.map((e) => Governorates.fromJson(e)).toList();
}
