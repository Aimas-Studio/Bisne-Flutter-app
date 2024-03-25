class CreateShopDto {
  String adminId;
  String name;
  String description;
  String urlImage;
  String? location;
  String? schedule;
  String? whatsAppNumber;
  String? phoneNumber;
  String? facebook;
  String? instagram;
  String? link;
  String region;
  String municipality;
  String? telegram;

  CreateShopDto({
    required this.adminId,
    required this.name,
    required this.description,
    required this.urlImage,
    required this.region,
    required this.municipality,
    this.schedule,
    this.whatsAppNumber,
    this.link,
    this.phoneNumber,
    this.facebook,
    this.instagram,
    this.location,
    this.telegram,
  });

  @override
  String toString() {
    return '''CreateShopDto:
    name: $name ,
    description: $description ,
    schedule: $schedule ,
    whatsApp: $whatsAppNumber ,
    phone: $phoneNumber ,
    instagram: $instagram ,
    link: $link
    url: $urlImage, 
    location: $location,
    region: $region,
    municipality: $municipality,
    telegram: $telegram''';
  }
}
