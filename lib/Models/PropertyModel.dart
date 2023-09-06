class PropertyModel {
  String id;
  bool? isFav;
  String propertyTitle;
  String location;
  num price;
  String imageUrl;
  num beds;
  num baths;
  num kitchens;
  String description;

  PropertyModel({
    required this.id,
    required this.description,
    this.isFav,
    required this.propertyTitle,
    required this.location,
    required this.price,
    required this.baths,
    required this.beds,
    required this.kitchens,
    required this.imageUrl,
  });
}
