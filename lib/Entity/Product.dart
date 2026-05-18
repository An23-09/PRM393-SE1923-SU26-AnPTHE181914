import 'dart:io';

class Product {
  String id;
  String name;
  String image;
  double price;

  Product({required this.id, this.name = "", this.image = "", this.price = 0});

  Product CopyTo({String? id, String? name, String? image, double? price}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  // Danh sách các product
  static List<Product> products = [
    Product(id: "01", name: "San pham A", image: "Hinh anh 1", price: 10.2),
    Product(id: "02", name: "San pham B", image: "Hinh anh 2", price: 20.1),
    Product(id: "03", name: "San pham C", image: "Hinh anh 3", price: 15.8),
    Product(id: "04", name: "San pham D", image: "Hinh anh 4", price: 11.4),
    Product(id: "05", name: "San pham E", image: "Hinh anh 5", price: 19.5),
  ];

  // Hiển thị product
  static List<Product> showAllProduct() {
    for (var p in products) {
      print(
        "ID: ${p.id} | Name: ${p.name}, Image: ${p.image}, Price: ${p.price}",
      );
    }
    return products;
  }

  //Thêm product
  static void add(Product p) {
    bool existed = products.any((e) => e.id == p.id);

    if (existed) {
      print("ID da ton tai!");
      return;
    }

    products.add(p);
    print("Them thanh cong!");
  }

  // Sửa product
  static void update(String id, Product newProduct) {
    int index = products.indexWhere((p) => p.id == id);

    if (index == -1) {
      print("Khong tim thay!");
      return;
    }

    products[index] = newProduct;
    print("Cap nhat thanh cong!");
  }

  // Xóa product
  static void delete(String id) {
    products.removeWhere((p) => p.id == id);
    print("Da xoa!");
  }

  // Tìm kiếm product theo name
  static void search(String keyword) {
    var result = products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    if (result.isEmpty) {
      print("Khong tim thay!");
      return;
    }

    result.forEach(print);
  }

  // Sắp xếp product theo giá tăng
  static void sortAsc() {
    products.sort((a, b) => a.price.compareTo(b.price));
    print("Da sap xep tang!");
  }

  // Sắp xếp product theo giá giảm
  static void sortDesc() {
    products.sort((a, b) => b.price.compareTo(a.price));
    print("Da sap xep giam!");
  }
}
