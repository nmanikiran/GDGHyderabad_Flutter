import 'dart:core';

class Item {
  int id;
  String title;
  String description;
  String price;
  String colors;
  String category;
  String image;

  Item({
    this.id,
    this.title,
    this.description,
    this.price,
    this.colors,
    this.category,
    this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return new Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      colors: json['colors'].toString(),
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    // map["id"] = id ?? "";
    map["title"] = title ?? "";
    map["description"] = description ?? "";
    map["price"] = price ?? "";
    map["category"] = category ?? "";
    map["colors"] = colors ?? "";
    map["image"] = image ?? "";
    return map;
  }

  @override
  String toString() {
    return 'Item{'
        'title:$title,'
        'description:$description,'
        'category:$category,'
        'price:$price,'
        'image:$image,'
        'colors:$colors,'
        '}';
  }
}
