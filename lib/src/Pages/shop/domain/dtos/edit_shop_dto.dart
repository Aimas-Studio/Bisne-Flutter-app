class EditShopDto {
  String description;
  String? schedule;
  String? whatsAppNumber;
  String? phoneNumber;
  String? facebook;
  String? instagram;
  String? link;
  String? urlImage;

  EditShopDto({
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
