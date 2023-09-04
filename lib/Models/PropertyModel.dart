class PropertyModel {
  String? id;
  bool? isFav;
  String? propertyTitle;
  String? location;
  num? price;
  String? imageUrl;
  num? beds;
  num? baths;
  num? kitchens;

  PropertyModel({
    this.id,
    this.isFav,
    this.propertyTitle,
    this.location,
    this.price,
    this.baths,
    this.beds,
    this.kitchens,
    this.imageUrl,
  });
}
