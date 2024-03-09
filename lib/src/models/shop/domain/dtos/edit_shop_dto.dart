class EditShopDto {
  String description;
  String? schedule;
  String? whatsAppNumber;
  String? phoneNumber;
  String? facebook;
  String? instagram;
  String? link;
  String? urlImage;
  String? location;
  String region;
  String municipality;

  EditShopDto({
    required this.region,
    required this.municipality,
    required this.description,
    this.schedule,
    this.whatsAppNumber,
    this.link,
    this.location,
    this.phoneNumber,
    this.facebook,
    this.instagram,
    this.urlImage,
  });

  @override
  String toString() {
    return '''EditShopDto:
    description: $description ,
    schedule: $schedule ,
    whatsApp: $whatsAppNumber ,
    phone: $phoneNumber ,
    instagram: $instagram ,
    link: $link
    url: $urlImage ''';
  }
}
