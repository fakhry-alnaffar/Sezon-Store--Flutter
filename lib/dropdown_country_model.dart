class DropdownCountryModel {
  int id;

  String? flag;
  String title;

  DropdownCountryModel({
    required this.id,
    required this.title,
    this.flag,
  });
}