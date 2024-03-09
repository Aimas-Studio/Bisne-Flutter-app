class Shop {
  int id;
  String shopName;
  String shopDescription;
  String shopLocation;
  String openingHours;
  String phoneNumber;
  String whatsAppNumber;
  String instagramAccount;
  String facebookAccount;
  String telegramAccount;
  String optionalLink;
  String imageUrl;
  String category;

  Shop({
    required this.id,
    required this.shopName,
    required this.shopDescription,
    required this.imageUrl,
    this.shopLocation = '',
    this.openingHours = '',
    this.phoneNumber = '',
    this.whatsAppNumber = '',
    this.instagramAccount = '',
    this.facebookAccount = '',
    this.optionalLink = '',
    this.telegramAccount = '',
    this.category = '',
  });

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      shopName: map['nombre'],
      shopDescription: map['descripcion'],
      openingHours: map['horario'],
      whatsAppNumber: map['numeroWhatsapp'] ?? '',
      phoneNumber: map['numeroTelefono'] ?? '',
      telegramAccount: map['usuarioTelegram'] ?? '',
      facebookAccount: map['linkFacebook'] ?? '',
      instagramAccount: map['linkInstagram'] ?? '',
      optionalLink: map['linkExtra'] ?? '',
      imageUrl: map['imageURL'] ?? '',
    );
  }
}
