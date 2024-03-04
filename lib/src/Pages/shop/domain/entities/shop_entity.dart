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
  String optionalLink;
  bool delivery;
  String category;
  String imageUrl;

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
    this.delivery = false,
    this.category = '',
  });
}
