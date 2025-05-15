class Products {
  final String title;
  final String image;
  final String category;
  final String price;
  Products({
    required this.price,
    required this.title,
    required this.image,
    required this.category,
  });
  factory Products.fromJson(Map<String, dynamic> json) {
    final String tit = json['title'];
    final String ima = json['image'];
    final String categ = json['category'];
    final String pri = json['price'];
    return Products(
      price: pri,
      title: json['title'],
      image: ima,
      category: categ,
    );
  }
}
