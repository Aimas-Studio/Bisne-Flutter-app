class Shop {
  String id;
  String name;
  String description;
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
  int manageId;
  List<String> subcategories = ['Subcategoria provisional'];
  String region;
  String municipality;

  Shop({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.manageId,
    required this.description,
    required this.region,
    required this.municipality,
    this.shopLocation = '',
    this.openingHours = '',
    this.phoneNumber = '',
    this.whatsAppNumber = '',
    this.instagramAccount = '',
    this.facebookAccount = '',
    this.optionalLink = '',
    this.telegramAccount = '',
    this.category = 'Alimentos',
  });

  factory Shop.fromMap(Map<String, dynamic> map, String category) {
    return Shop(
      id: map['id'],
      name: map['nombre'],
      region: map['provincia'],
      municipality: map['municipio'],
      openingHours: map['horario'],
      description: map['descripcion'],
      manageId: map['administradorId'],
      whatsAppNumber: map['numeroWhatsapp'] ?? '',
      phoneNumber: map['numeroTelefono'] ?? '',
      telegramAccount: map['usuarioTelegram'] ?? '',
      facebookAccount: map['linkFacebook'] ?? '',
      instagramAccount: map['linkInstagram'] ?? '',
      optionalLink: map['linkExtra'] ?? '',
      imageUrl: map['imageURL'] ?? '',
      shopLocation: map['direccion'] ?? '',
      category: category == '' ? 'Nueva Tienda' : category,
    );
  }
}
