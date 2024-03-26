class CreateOfertDto {
  String shopId;
  String name;
  String description;
  String imageURL;
  String labelId;
  String categoryId;
  String price;

  CreateOfertDto({
    required this.shopId,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.categoryId,
    required this.price,
    required this.labelId,
  });

  @override
  String toString() {
    return '''CreateOfertDto:
    name: $name ,
    description: $description ,
    categoryId: $categoryId ,
    price: $price ,
    labelId: $labelId ,
    shopId: $shopId,
    url: $imageURL
    ''';
  }
}
