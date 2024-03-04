class CreateShopDto {
  String name;
  String description;
  String? schedule;
  String? whatsAppNumber;
  String? phoneNumber;
  String? facebook;
  String? instagram;
  String? link;
  String? urlImage;

  CreateShopDto({
    required this.name,
    required this.description,
    this.schedule,
    this.whatsAppNumber,
    this.link,
    this.phoneNumber,
    this.facebook,
    this.instagram,
    this.urlImage,
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
