class Shop {
  int id;
  String shopName;
  String shopDescription;
  dynamic shopLocation;
  dynamic openingHours;
  String phoneNumber;
  String whatsAppNumber;
  String instagramAccount;
  String facebookAccount;
  String optionalLink;
  bool delivery;
  List<String> categories;
  String imageUrl;
  Shop(
      this.id,
      this.shopName,
      this.shopDescription,
      this.shopLocation,
      this.openingHours,
      this.phoneNumber,
      this.whatsAppNumber,
      this.instagramAccount,
      this.facebookAccount,
      this.optionalLink,
      this.delivery,
      this.categories,
      this.imageUrl);
}

class ShopDump {
  String shopName;
  String imageUrl;
  ShopDump(this.shopName, this.imageUrl);
}
