class Product {
  final int id;
  final String kode;
  final String produk;
  final int harga;
  final String img;
  final int isActive;
  final String updated;

  Product({
    required this.id,
    required this.kode,
    required this.produk,
    required this.harga,
    required this.img,
    required this.isActive,
    required this.updated,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      kode: json['kode'] ?? '',
      produk: json['produk'] ?? '',
      harga: json['harga'] ?? 0,
      img: json['img'] ?? '',
      isActive: json['isActive'] ?? 0,
      updated: json['updated'] ?? '',
    );
  }
}
