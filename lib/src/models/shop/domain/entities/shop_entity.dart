class Shop {
  int id;
  String name;
  String description;
  String shopLocation;
  List<String> openingHours;
  String phoneNumber;
  String whatsAppNumber;
  String instagramAccount;
  String facebookAccount;
  String telegramAccount;
  String optionalLink;
  String imageUrl;
  String category;
  List<String> subcategories = ['Subcategoria provisional'];

  Shop({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.shopLocation = '',
    this.openingHours = const [],
    this.phoneNumber = '',
    this.whatsAppNumber = '',
    this.instagramAccount = '',
    this.facebookAccount = '',
    this.optionalLink = '',
    this.telegramAccount = '',
    this.category = 'Alimentos',
  });

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      name: map['nombre'],
      description: map['descripcion'],
      openingHours: [map['horario']],
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
