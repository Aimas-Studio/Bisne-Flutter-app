class CreateShopDto {
  String name;
  String description;
  String urlImage;
  String? schedule;
  String? whatsAppNumber;
  String? phoneNumber;
  String? facebook;
  String? instagram;
  String? link;

  CreateShopDto({
    required this.name,
    required this.description,
    required this.urlImage,
    this.schedule,
    this.whatsAppNumber,
    this.link,
    this.phoneNumber,
    this.facebook,
    this.instagram,
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
    url: $urlImage ''';
  }
}
